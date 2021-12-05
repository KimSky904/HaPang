<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 아이디 오류</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div style="width: 100%; height:200px; margin-top: 50px; text-align: center;">
		<div>
			<h1 class="display-3" style=" font-size: 30px">해당 상품이 존재하지 않습니다.</h1>
		</div>	
	</div>
	
	<div class="container">
		<p> <%= request.getRequestURL() %>?<%= request.getQueryString() %>
		<p> <a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo; </a>
	</div>
	
	<%@ include file="footer.jsp" %>	
</body>
</html>