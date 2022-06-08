package com.boribob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.PetDAO;
import com.boribob.dao.ProductDAO;
import com.boribob.dto.PetDTO;
import com.boribob.dto.ProductDTO;

@WebServlet("*.pet")
public class PetController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		if (uri.equals("/petInput.pet")) {
//			String id = ((MemberDTO)request.getSession().getAttribute("loginSession")).getId();
			
			String petType = request.getParameter("petType");
			String petName = request.getParameter("petName");
			
			String petBirthdayYear = request.getParameter("petBirthdayYear");
			String petBirthdayMonth = request.getParameter("petBirthdayMonth");
			String petBirthdayDay = request.getParameter("petBirthdayDay");
			String petBirthday = petBirthdayYear + petBirthdayMonth + petBirthdayDay;
			int petAge = 0;
			try {
				PetDAO dao = new PetDAO();
				petAge = dao.getPetAge(petBirthday);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			int petWeight = Integer.parseInt(request.getParameter("petWeight"));
			String petKind = request.getParameter("petKind");
			
			String petAllergyInput = request.getParameter("petAllergy");
			int petAllergy = 0;
			if (petAllergyInput == "없음") {
				petAllergy = 0;
			} else {
				petAllergy = 1;
			}
			
			System.out.println("펫 종류 : " + petType);
			System.out.println("펫 타입 : " + petKind);
			System.out.println("펫 이름 : " + petName);
			System.out.println("펫 생년월일 : " + petBirthday);
			System.out.println("펫 나이 : " + petAge);
			System.out.println("펫 몸무게 : " + petWeight);
			System.out.println("펫 알러지 : " + petAllergy);
			
			try {
				PetDAO dao = new PetDAO();
				PetDTO petDto = new PetDTO("1", petName, petAge, petAllergy, petWeight, petKind, petType);
				ProductDAO productDao = new ProductDAO();
				int productNum = dao.getProductNum(dao.getPetStatus(petDto));
//				String productName = (productDao.selectByCode(productNum)).getProductName();
				
				System.out.println("상품 번호 : " + productNum);
//				System.out.println("상품 이름 : " + productName);
				
				int rs = dao.insert(petDto);
				if (rs > 0) {
					System.out.println("펫 정보 입력 완료");
					request.setAttribute("petDto", petDto);
					request.setAttribute("productNum", productNum);
					request.getRequestDispatcher("/subscribe/subscribe.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
