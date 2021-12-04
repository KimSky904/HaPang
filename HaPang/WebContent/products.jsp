<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div style="height:90px"></div>
	<hr width=80%>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4" style="width:70px">
			<a href="./product.jsp?id=<%=rs.getString("p_id")%>" style="color:black; text-decoration : none;">
			<!-- 이미지 -->
				<img src="C:/upload/<%=rs.getString("p_fileName")%>" style="width:60%">
				<hr>
			<!-- 상품명 -->
				<h3 style="font-size: 20px;"><%= rs.getString("p_name")%></h3>
			<!-- 상품설명 -->
				<p style="font-size: 12px;"><%= rs.getString("p_description")%></p>
			<!-- 상품할인율 + 원가 -->
				<p style="font-size: 12px; display:inline;">33%</p>
				<p style="font-size: 12px; display:inline;"> |</p>
				<p style="font-size: 12px; display:inline;"> 23,200</p>
			<!-- 상품판매가 + 배송분류 -->
				<p style="font-size: 12px; color: red; font-style: bold; text-align: left"><%= rs.getString("p_unitPrice")%>원
					<img src="C:/upload/rocketDelivery.png" alt="logo" style="width:20%">
				</p>
			<!-- 도착정보 -->
				<p style="font-size: 11px;">수요일 12/8 도착 예정</p>  
				</a>
			</div>
			<%
				}
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />	
</body>
</html>







