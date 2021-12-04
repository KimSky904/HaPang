<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>페이지 오류</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">해당 페이지를 찾을 수 없습니다.</h1>
		</div>	
	</div>
	
	<div class="container">
		<p> <%= request.getRequestURL() %>
		<p> <a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo; </a>
	</div>
	
	<%@ include file="footer.jsp" %>	
</body>
</html>