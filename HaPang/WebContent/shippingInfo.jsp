<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css">
<title>배송 정보</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<div style="height:40px"></div>
	
	<p ><h3 style="margin-left: 210px; font-size:25px;">구매자정보</h3>
	<hr width=80%>
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>"/>
			<div class="from-group row" style="margin-bottom: 30px;">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"/>                                                                                                                                                                                                            
				</div>
			</div>
			<div class="from-group row" style="margin-bottom: 30px;">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phoneNumber" type="text" class="form-control"/>                                                                                                                                                                                                           
				</div>
			</div>
			<div class="from-group row" style="margin-bottom: 30px;">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control"/>                                                                                                                                                                                                        
				</div>
			</div>
			<div class="from-group row" style="margin-bottom: 30px;">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="addressName" type="text" class="form-control"/>                                                                                                                                                                                                        
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button">이전	</a>
					<input type="submit" class="btn btn-primary" value="등록">
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>	
				</div>
			</div>
		</form>
	</div>
</body>
</html>