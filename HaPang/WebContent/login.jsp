<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background: white">
		<div class="container" style="background: white">
		</div>	
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">
			Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">
						User Name
					</label>
					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassWord" class="sr-only">
						PassWord
					</label>
					<input type="password" class="form-control" placeholder="Password" name="j_password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>	
</body>
</html>







