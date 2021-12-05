<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie phoneNumber = new Cookie("Shipping_phoneNumber",URLEncoder.encode(request.getParameter("phoneNumber"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
	
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	phoneNumber.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(phoneNumber);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
%>