<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String filename="";
	String realFolder="C:\\upload"; //웹 어플리케이션의 절대 경로
	int maxsize = 5*1024*1024;  //최대 업로드될 크기 5MB
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price= 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	
	Enumeration files= multi.getFileNames();	// Enumeration files에 이름을 가져온다.
	String fname = (String) files.nextElement(); 	//files에 있는 파일 이름을 가져옴
	String fileName = multi.getFilesystemName(fname);	//서버에 실제 저장된 파일 이름을 가져옴(이름중복시 바뀌는 경우도 있기 때문에)
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	rs = pstmt.executeQuery(); //executeQuery => select문에 사용 + updateQuery => update, insert문에 사용
	
	if(rs.next()){	
		if(fileName != null){	
			sql = "update product SET p_name=?,p_unitPrice=?,p_description=?,p_manufacturer=?,p_category=?,p_unitsInStock=?,p_condition=?,p_fileName=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, fileName);
			pstmt.setString(9, productId);
			pstmt.executeUpdate();
		} else {
			sql = "update product SET p_name=?,p_unitPrice=?,p_description=?,p_manufacturer=?,p_category=?,p_unitsInStock=?,p_condition=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		}
	}
	if(rs != null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
	
	response.sendRedirect("managerPage.jsp");
%>










