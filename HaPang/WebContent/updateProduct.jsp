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
			if(rs.next()){		
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
				<img src="c:/upload/<%=rs.getString("p_fileName") %>" style="width:80%" alt="image"/>
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">상품 코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" 
							value="<%=rs.getString("p_id") %>">
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" 
							value="<%=rs.getString("p_name") %>" style="width:200px;">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품원가</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" 
							value="<%=rs.getInt("p_UnitPrice") %>" style="width:200px;">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품할인율</label>
						<div class="col-sm-5">
							<input type="text" id="discountRate" name="discountRate" class="form-control" 
							value="<%=rs.getInt("p_discountRate") %>" style="width:200px;">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품설명</label>
						<div class="col-sm-3">
							<textarea name="description" col="50" rows="2"
							 class="form-control" style="width:200px;"><%=rs.getString("p_description") %></textarea> 
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control" 
							value="<%=rs.getString("p_manufacturer") %>" style="width:200px;">
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">카테고리</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control" 
							value="<%=rs.getString("p_category") %>" style="width:200px;">
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-5">
							<input type="text" name="unitsInStock" class="form-control" 
							value="<%=rs.getLong("p_unitsInStock") %>" style="width:200px;">
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">상품상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="새상품" checked="checked">새상품
							<input type="radio" name="condition" value="중고상품">중고상품
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">상품이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control" >
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">배송유형</label>
						<div class="col-sm-5">
							<input type="radio" name="deliveryType" value="로켓배송" >로켓배송
							<input type="radio" name="deliveryType" value="일반배송" checked="checked">일반배송
						</div>
					</div>	
					<div class="form-group row">
						<label class="col-sm-2">배송비</label>
						<div class="col-sm-5">
							<input type="text" id="deliveryFee" name="deliveryFee" class="form-control" 
							value="<%=rs.getInt("p_deliveryFee") %>" style="width:200px;">
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