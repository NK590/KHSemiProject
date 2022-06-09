package com.boribob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.PetDAO;
import com.boribob.dao.ProductDAO;
import com.boribob.dto.MemberDTO;
import com.boribob.dto.PetDTO;

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
			String id = ((MemberDTO)request.getSession().getAttribute("loginSession")).getId();
			
			String petType = request.getParameter("petType");
			String petName = request.getParameter("petName");
			
			String petBirthdayYear = request.getParameter("petBirthdayYear");
			String petBirthdayMonth = request.getParameter("petBirthdayMonth");
			if (petBirthdayMonth.length() == 1) {
				petBirthdayMonth = "0" + petBirthdayMonth;
			}
			String petBirthdayDay = request.getParameter("petBirthdayDay");
			if (petBirthdayDay.length() == 1) {
				petBirthdayDay = "0" + petBirthdayDay;
			}
			
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
			if (petAllergyInput == "없음" || petAllergyInput == "") {
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
				PetDTO petDto = new PetDTO(id, petName, petAge, petAllergy, petWeight, petKind, petType);
				ProductDAO productDao = new ProductDAO();
				int productCode = dao.getProductNum(dao.getPetStatus(petDto));
				String productName = (productDao.selectByCode(productCode)).getProductName();
				
				System.out.println("상품 번호 : " + productCode);
				System.out.println("상품 이름 : " + productName);
				
				request.setAttribute("petDto", petDto);
				request.setAttribute("productCode", productCode);
				request.getRequestDispatcher("/subscribe/subscribe.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uri.equals("/pet.pet")) {
			response.sendRedirect("/pet/petInput.jsp");
		}
	}
}
