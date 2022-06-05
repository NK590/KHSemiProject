package com.boribob.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

import com.boribob.dao.ProductDAO;
import com.boribob.dto.ProductDTO;
import com.google.gson.Gson;

@WebServlet("*.pro")
public class ProductController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf-8");
		System.out.println("uri : " + uri);

		if (uri.equals("/product.pro")) { // navivar에서 product메뉴를 누르면 전체 상품을 띄워주는 페이지로 이동한다.

			ProductDAO dao = new ProductDAO();
			try {
				ArrayList<ProductDTO> productList = dao.selectAll(); // 전체 상품에 대한 내용을 productList로 받아온다.
				request.setAttribute("productList", productList); // 전체 상품 값 셋팅

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/product/productList.jsp").forward(request, response); // productList.jsp로
																									// productList를
																									// 뿌려준다.

		} else if (uri.equals("/productDetail.pro")) { // 전체 상품페이지에서 상품을 클릭하면 해당 상품으로 이동 (anchor 태그 활용)
				int productCode = Integer.parseInt(request.getParameter("productCode"));
				ProductDAO dao = new ProductDAO(); 
			try {
				ProductDTO product = dao.selectByCode(productCode);
				request.setAttribute("product", product);			
			}catch(Exception e) {e.printStackTrace();
			}
			request.getRequestDispatcher("/product/productDetail.jsp").forward(request, response);
		
		}else if(uri.equals("/productDog.pro")){   // 강아지 사료만 조회
			System.out.println(uri);
			ProductDAO dao = new ProductDAO();
			
			
			try {
				
				ArrayList<ProductDTO> list = dao.selectByDog();
				
				
				Gson gson = new Gson();
				String dogList = gson.toJson(list);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(dogList);
				
			
			}catch(Exception e) {e.printStackTrace();
			}
			
		}else if(uri.equals("/productCat.pro")){   // 고양이 사료만 조회
			ProductDAO dao = new ProductDAO();
			
			try {
				
				ArrayList<ProductDTO> list = dao.selectByCat();
				
				
				Gson gson = new Gson();
				String catList = gson.toJson(list);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(catList);
				
			
			}catch(Exception e) {e.printStackTrace();
			}
			
		}
		
		
		
		
//		else if (uri.equals("/searchName.pro")) { // 전체 상품 페이지에서 상품 검색시 해당 상품만 띄워주기
//
//		String productName = request.getParameter("productName");
//		ProductDAO dao = new ProductDAO();
//
//		try {
//			ProductDTO dto = dao.selectByName(productName); // 해당 상품정보 불러오기
//
//			if (dto != null) { // 해당 상품이름이 존재하면 dto 보내주기
//				request.setAttribute("dto", dto);
//				Gson gson = new Gson();
//				String rs = gson.toJson(dto);
//				response.setCharacterEncoding("utf-8");
//				response.getWriter().append(rs);
//			} else {
//				response.getWriter().append("fail"); // 실패하면 fail text 보내기
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
	}

	}

