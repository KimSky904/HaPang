<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div style="height:90px"></div>
	<hr width=80%>
	<div style="height:40px"></div>
		<%@
			include file="dbconn.jsp"
		%>
		<%
			String productId = request.getParameter("id");
					
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM product where p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			System.out.println(productId);
			if(rs.next()){		
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
				<img src="c:/upload/<%=rs.getString("p_fileName") %>" style="width:100%" alt="image"/>
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" value="<%=rs.getString("p_id")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name")%>"> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품원가</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getString("p_unitPrice")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품할인율</label>
				<div class="col-sm-3">
					<input type="text" id="discountRate" name="discountRate" class="form-control" value="<%=rs.getString("p_discountRate")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" cols="50"
					class="form-control"><%=rs.getString("p_description")%></textarea>				
				</div>
			</div>				
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수 </label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getString("p_unitsInStock")%>">
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
					<input type="text" id="deliveryFee" name="deliveryFee" class="form-control" value="<%=rs.getString("p_deliveryFee")%>">
				</div>
			</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
			<%
				}
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close(); %>
		<hr>
	<jsp:include page="footer.jsp"/>
</body>
</html>