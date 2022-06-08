package com.boribob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.ProductDAO;

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
			int subscribeMonth = Integer.parseInt(request.getParameter("subscribeType"));
			
			try {
				ProductDAO productDao = new ProductDAO();
//				int price = (productDao.selectByCode());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
