<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
System.out.println(1);
		String id = request.getParameter("id");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		System.out.println(2);
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		if(product == null){
			response.sendRedirect("exceptionNoProductId.jsp");
		}
		System.out.println(3);
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
		Product goodsQnt = new Product();
		for(int i=0;i<cartList.size();i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
%>