	<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF8");
    String cartId = session.getId();
    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_addressName = "";
	
    Cookie[] cookies = request.getCookies();
    
    if(cookies!=null){
    	for(int i = 0;i<cookies.length;i++){
    		Cookie thisCookie = cookies[i];
    		String n = thisCookie.getName();
    		if(n.equals("Shipping_cartId")) shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
    		if(n.equals("Shipping_name")) shipping_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
    		if(n.equals("Shipping_country")) shipping_country=URLDecoder.decode((thisCookie.getValue()), "utf-8");
    		if(n.equals("Shipping_zipCode")) shipping_zipCode=URLDecoder.decode((thisCookie.getValue()), "utf-8");
    		if(n.equals("Shipping_addressName")) shipping_addressName=URLDecoder.decode((thisCookie.getValue()), "utf-8");
    	}
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<hr width=80%>
	<div style="height:40px"></div>
	<div class="container col-8 alert alert-info" style="background: white">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong>
				<br> 성   명 : <%out.println(shipping_name);  %><br>
				<br> 고객번호 : <%out.println(shipping_name);  %><br>
				<br> 주   소 : <%out.println(shipping_addressName);  %>(<%out.println(shipping_zipCode);%>)<br>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">제품</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>	
				</tr>
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
					if(cartList == null) cartList = new ArrayList<Product>();
					for(int i=0;i<cartList.size();i++){
						//상품 리스트 하나씩 출력
						Product product = cartList.get(i);
						int total = product.getUnitPrice()*product.getQuantity();	
						sum = sum+total;
						%>
						<tr>
							<td class="text-center"> <em><%=product.getPname() %></em></td>
							<td class="text-center"> <em><%=product.getQuantity() %></em></td>
							<td class="text-center"> <em><%=product.getUnitPrice() %></em></td>
							<td class="text-center"> <em><%=total %></em></td>
						</tr>
					<%
						}
					%>
					<tr>
						<td></td>
						<td></td>
						<td class="text-right"><strong>총액 : </strong></td>
						<td class="text-center text-danger"><strong><%=sum %></strong></td>
					</tr>
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">주문취소</a>
		</div>
	</div>
</body>
</html>