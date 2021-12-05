<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	String realFolder="C:\\upload"; //웹 어플리케이션의 절대 경로
	int maxsize = 5*1024*1024;  //최대 업로드될 크기 5MB
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId"); //고유번호
	String name = multi.getParameter("name"); //상품명
	String unitPrice = multi.getParameter("unitPrice"); //원가
	String discountRate = multi.getParameter("discountRate"); //할인율
	String description = multi.getParameter("description");  //상세정보
	String manufacturer = multi.getParameter("manufacturer"); //제조사
	String category = multi.getParameter("category"); //카테고리
	String unitsInStock = multi.getParameter("unitsInStock"); //재고수
	String condition = multi.getParameter("condition"); //상품상태
	String deliveryType = multi.getParameter("deliveryType");//배송유형
	String deliveryFee = multi.getParameter("deliveryFee");//배송비
	
	long price; //원가
	long rate; //할인율
	long sellPrice; //판매가
	long stock; //재고수
	long additionalFee; //배송비 
	
	//원가
	if(unitPrice.isEmpty())
		price= 0;
	else
		price = Integer.valueOf(unitPrice);
	//할인율
	if(discountRate.isEmpty())
		rate= 0;
	else
		rate = Integer.valueOf(discountRate);
	//판매가
	sellPrice = price*(100-rate)/100;
	
	//재고수
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//배송비 
	if(deliveryType.equals("로켓배송")){
		additionalFee = 0;
	} else {
		if(deliveryFee.isEmpty())
			additionalFee = 0;
		else
			additionalFee = Long.valueOf(deliveryFee);
	}

	
	
	Enumeration files= multi.getFileNames();	// Enumeration files에 이름을 가져온다.
	String fname = (String) files.nextElement(); 	//files에 있는 파일 이름을 가져옴
	String fileName = multi.getFilesystemName(fname);	//서버에 실제 저장된 파일 이름을 가져옴(이름중복시 바뀌는 경우도 있기 때문에)
	
	PreparedStatement pstmt = null;
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setLong(3, price);
	pstmt.setLong(4, rate);
	pstmt.setLong(5, sellPrice);
	pstmt.setString(6, description);
	pstmt.setString(7, manufacturer);
	pstmt.setString(8, category);
	pstmt.setLong(9, stock);
	pstmt.setString(10, condition);
	pstmt.setString(11, fileName);
	pstmt.setString(12, deliveryType);
	pstmt.setLong(13, additionalFee);
	pstmt.executeUpdate();
	
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	
	response.sendRedirect("managerPage.jsp");
%>










