package com.boribob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.ProductDAO;
import com.boribob.dto.MemberDTO;
import com.boribob.dto.PetDTO;
import com.boribob.dto.SubscribeDTO;

@WebServlet("*.sub")
public class SubscribeController extends HttpServlet {
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
		
		if (uri.equals("/subscribeInput.sub")) {
			int subscribeTerm = Integer.parseInt(request.getParameter("subscribeType"));
			int productCode = Integer.parseInt(request.getParameter("productCode"));
			int productPrice = 0;

			ProductDAO productDao = new ProductDAO();
			try {
				productPrice = (productDao.selectByCode(productCode)).getProductPrice();
			} catch (Exception e) {
				e.printStackTrace();
			}
			int subscribePrice = productPrice * subscribeTerm;
			System.out.println("상품 가격 : " + productPrice);
				
			String id = ((MemberDTO)request.getSession().getAttribute("loginSession")).getId();
			
			String petName = request.getParameter("petName");
			int petAge = Integer.parseInt(request.getParameter("petAge"));
			int petAllergy = Integer.parseInt(request.getParameter("petAllergy"));
			int petWeight = Integer.parseInt(request.getParameter("petWeight"));
			String petKind = request.getParameter("petKind");
			String petType = request.getParameter("petType");
			
			System.out.println(id + " : " + petName + " : " + petAge + " : " + petAllergy + " : " + petWeight + " : " + petKind + " : " + petType);
			System.out.println(id + " : " + productCode + " : " + subscribeTerm);
			
			PetDTO petDto = new PetDTO(id, petName, petAge, petAllergy, petWeight, petKind, petType);
			SubscribeDTO subscribeDto = new SubscribeDTO(id, productCode, "Dummy", subscribeTerm);

			request.setAttribute("petDto", petDto);
			request.setAttribute("subscribeDto", subscribeDto);
			request.setAttribute("subscribePrice", subscribePrice);
			request.getRequestDispatcher("/form.order").forward(request, response);
		}
	}
}
