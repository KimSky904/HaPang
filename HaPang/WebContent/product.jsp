<%@page import="java.util.Calendar"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
 
<%@ page errorPage="exceptionNoProductId.jsp" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>

<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<div style="height:90px"></div>

	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product where p_id = ?";
		pstmt = conn.prepareStatement(sql); //디비로 전송
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if(rs.next()){	
	%>
	<div class="container">
		<div class="row">
			<div class = "col-md-5">
				<img src="C:/upload/<%=rs.getString("p_fileName")%>" style="width:80%"/>
			</div> 			
			<div class="col-md-6">
			<!-- 고유번호,상품명 -->
				<span class="badge badge-danger" style="margin-bottom: 10px"><%=rs.getString("p_id")%></span>
				<h3 style="font-size: 20px; font-style:inherit ; margin-bottom: 5px;"><%= rs.getString("p_name") %></h3>
				<p><hr style="width: 80%; height:10px ; margin:0px; float: left;"> <br></p>
			<!-- 원가,할인율,판매가 -->
				<p style="font-size: 12px; display:inline;"><%= rs.getInt("p_discountRate")%>% </p>
				<p style="font-size: 12px; display:inline;"> |</p>
				<p style="font-size: 12px; display:inline; text-decoration:line-through"><%= rs.getInt("p_unitPrice")%>원<br></p>
				<p style="font-size: 18px; color: #9F1F14; font-weight: bold; display: inline;"><%= rs.getInt("p_discountedPrice")%>원</p>
			<!-- 로켓배송 -->
			<%
				if(rs.getString("p_deliveryType").equals("로켓배송")){
			%>
				<img src="C:/upload/rocketDelivery.png" alt="logo" style="width:15%; display: inline;">
				<p><hr style="width: 80%; height:10px ; margin:0px; float: left; margin-bottom: 0px;"> <br></p>
				<p><h3 style="font-size: 11px;">무료배송</h3>
			<%
				} else {
			%>
				<p><hr style="width: 80%; height:10px ; margin:0px; float: left; margin-bottom: 0px;"> <br></p>
				<p><h3 style="font-size: 11px;">배송비 <%=rs.getInt("p_deliveryFee") %>원</h3>
			<%
				}
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
				<p style="font-size: 17px; font-weight:bold; color: #3B872E;"><%= arriveInfo%></p>  
				<p><hr style="width: 80%; height:10px ; margin:0px; float: left; margin-bottom: 0px;"> <br></p>
			<!-- 세부정보 -->
				<p style="font-size: 12px;"><%= rs.getString("p_description")%></p>
				<p style="font-size: 12px;"><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p style="font-size: 12px;"><b>분류</b> : <%=rs.getString("p_category")%>
				<p style="font-size: 12px;"><b>재고 수</b> : <%=rs.getString("p_unitsInStock")%>
			<!-- 버튼 -->
				<p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method="post">
					<!-- <input type="hidden" name="productCount" value="6"> -->
					<select name="amount" style="width: 90px; height: 39px;">
						<%
						int stock = Integer.parseInt(rs.getString("p_unitsInStock"));
							for(int i=1;i<=stock;i++){
						%>
							<option value=<%=i %>><%=i %></option>
						<%
							}
						%>
					</select>
					<a href="#" class="btn btn-info" onClick="addToCart()">상품주문&raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
				</form> 
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
	<%@ include file="footer.jsp" %>	
</body>
</html>