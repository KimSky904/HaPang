<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
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
	<div style="height:40px"></div>
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
				<p style="font-size: 12px; display:inline;"><%= rs.getInt("p_discountRate")%>% </p>
				<p style="font-size: 12px; display:inline;"> |</p>
				<p style="font-size: 12px; display:inline; text-decoration:line-through;"><%= rs.getInt("p_unitPrice")%>원</p>
			<!-- 상품판매가 + 배송분류 -->
				<p style="font-size: 12px; color: red; font-style: 10000; font-weight: bold; color: #9F1F14"><%= rs.getString("p_discountedPrice")%>원
				<%
					//현재 날짜정보
					Calendar calendar = Calendar.getInstance();
					String strDayOfWeek="";
					int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
					int month = calendar.get(Calendar.MONTH);
					int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
					String arriveInfo="";
					//로켓배송인지 확인 (1일 후 도착)
					if(rs.getString("p_deliveryType").equals("로켓배송")){
						dayOfWeek++;
						arriveInfo+="내일";
				%>
					<img src="C:/upload/rocketDelivery.png" alt="logo" style="width:20%">
				<%
					}
					//일반배송 (2일 후 도착)
					else {
						dayOfWeek+=2;
					}
					
					switch(dayOfWeek){
					case 0 : 
						strDayOfWeek = "일"; break;
					case 1 : 
						strDayOfWeek = "월"; break;
					case 2 : 
						strDayOfWeek = "화"; break;
					case 3 : 
						strDayOfWeek = "수"; break;
					case 4 : 
						strDayOfWeek = "목"; break;
					case 5 : 
						strDayOfWeek = "금"; break;
					case 6 : 
						strDayOfWeek = "토"; break;
					}
					
					arriveInfo+="("+strDayOfWeek+") "+month+"/"+dayOfMonth+" 도착 보장";
					
				%>
				</p>
			<!-- 도착정보 -->
				<p style="font-size: 15px; color: #78AC6F"><%= arriveInfo%></p>  
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







