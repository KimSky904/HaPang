<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" 
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div style="height:90px"></div>
	<hr width=80%>
	<div style="height:40px"></div>
	<div class="container">
		<form name="newProduct" action="./processAddProduct.jsp" 
		class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품원가</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품할인율</label>
				<div class="col-sm-3">
					<input type="text" id="discountRate" name="discountRate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" cols="50"
					class="form-control"></textarea>				
				</div>
			</div>				
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수 </label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
					<input type="radio" name="condition" value="새상품">새상품
					<input type="radio" name="condition" value="중고상품">중고상품
				</div>				
			</div>		
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송 유형</label>
				<div class="col-sm-3">
					<input type="radio" id="deliveryType" name="deliveryType" value="로켓배송">로켓배송
					<input type="radio" id="deliveryType" name="deliveryType" value="일반배송">일반배송
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">추가 요금</label>
				<div class="col-sm-3">
					<input type="text" id="deliveryFee" name="deliveryFee" class="form-control">
				</div>
			</div>
			<div class="form-group row">				
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary"
					value="등록" onclick="CheckAddProduct()">
				</div>
			</div>		
		</form>
	</div>	
</body>
</html>







