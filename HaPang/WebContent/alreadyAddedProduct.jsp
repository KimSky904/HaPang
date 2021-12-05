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
	<div style="width: 100%; height:200px; margin-top: 50px; text-align: center;">
		<div>
			<h1 class="display-3" style=" font-size: 30px">이미 등록된 상품코드입니다.</h1>
		</div>	
	</div>
	
	<div class="container" align="center">
		<p> <a href="managerPage.jsp" class="btn btn-secondary">돌아가기 &raquo; </a>
	</div>
	
	
	<hr style="width: 90%; margin-top: 40px">
	<%@ include file="footer.jsp" %>	
</body>
</html>