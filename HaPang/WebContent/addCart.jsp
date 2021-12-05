<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
		//장바구니에 추가할 상품의 id값을 받아온다
		String id  = request.getParameter("id");
		if(id==null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		//solution
		//db에 존재하는 모든 상품을 넣을 arrayList<Product> 생성
		//arrayList 내에 받아온 id값과 일치하는 상품이 있는지 확인
		//product객체 생성, arrayList값을 하나씩 대입,id값과 일치하는 상품을 최종적으로 저장
		//장바구니 목록 arrayLIst 생성, 빈 장바구니일경우 세션에 생성
		//이미 장바구니에 있던 상품이면 개수++, 아니면 개수1
		//최종적으로 장바구니 list에 담을 상품을 add
		
		ArrayList<Product> products = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()){
			//Product 객체 생성
			Product product = new Product();
			product.setProductId(rs.getString("p_id"));
			product.setPname(rs.getString("p_name"));
			product.setUnitPrice(rs.getInt("p_unitPrice"));
			product.setSellPrice(rs.getInt("p_discountedPrice"));
			product.setDescription(rs.getString("p_description"));
			product.setManufacturer(rs.getString("p_manufacturer"));
			product.setCategory(rs.getString("p_category"));
			product.setUnitsInStock(rs.getLong("p_unitsInStock"));
			product.setCondition(rs.getString("p_condition"));
			product.setFilename(rs.getString("p_fileName"));
			product.setDeliveryType(rs.getString("p_deliveryType"));
			product.setDeliveryFee(rs.getInt("p_deliveryFee"));
			products.add(product);
		}
		//dao에 저장
		ProductRepository.listOfProducts = products;
		
		//한 상품에 대한 product객체 생성
		Product goods = new Product();
		//전체 상품 목록으로부터 product객체 정보 하나씩 받아봄
		for(int i=0;i<products.size();i++){
			goods = products.get(i);
			//전체 상품 목록과 일치하는 상품이 있을 경우 break; -> id값과 일치하는 상품 product 객체 생성
			if(goods.getProductId().equals(id)){
				break;
			}
		}
		
		//장바구니 목록 받아옴
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartList");
		if(list==null){ 
			list = new ArrayList<Product>();
			session.setAttribute("cartList", list);
		}
		
		int cnt = 0;
		//이미 장바구니에 있는 상품을 담을 시 개수++
		Product goodsQnt = new Product();
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity()+1;
				//주문 상품 시작이 1로 맞추기
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		
		if(cnt==0){
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("product.jsp?id="+id);
%>