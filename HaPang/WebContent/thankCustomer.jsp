<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><link rel = "stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate= "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")) shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
		}
	}
%>
	<jsp:include page="menu.jsp" />
	<hr width=80%>
	<div style="height:40px"></div>
<div>
	<h2 style="margin-left: 220px; font-size: 20px;">주문해주셔서 감사합니다.</h2><br><br>
</div>

<div class="container">
	<p> <a href="./products.jsp" class="btn btn-secondary">&laquo; 상품목록</a>
</div>
</body>
</html>

<%

	session.invalidate();
	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Customer_Id")) thisCookie.setMaxAge(0);
		if(n.equals("Customer_name")) thisCookie.setMaxAge(0);
		if(n.equals("Customer_PhoneNumber")) thisCookie.setMaxAge(0);
		if(n.equals("Customer_country")) thisCookie.setMaxAge(0);
		if(n.equals("Customer_zipCode")) thisCookie.setMaxAge(0);
		if(n.equals("Customer_addressName")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_cartId")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName")) thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie); //쿠키값 갱신
	}

%>