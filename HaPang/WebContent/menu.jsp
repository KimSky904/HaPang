<%@ page contentType="text/html; charset=UTF-8"%>

<nav class="navbar navbar-expand" style="background: white">
	<div class="container" style="background: white">
		<div class="navbar-header" style="background: white">
			<a class="navbar-brand" href="./products.jsp"><img src="img/hapangLogo.png" alt="logo"></a>
		</div>		

		<div>
			<ul class="navbar-nav mr-auto" style="color: black">
				<li class="nav-item" >
				<!-- href="./shoppingCart.jsp?edit=delete" -->
					<a class="nav-link" href="./cart.jsp?" style="color: black">장바구니</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link" href="./login.jsp" style="color: black">로그인</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link" href="./addProduct.jsp" style="color: black">상품등록</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link" href="./editProduct.jsp?edit=update" style="color: black">상품수정</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link" href="./editProduct.jsp?edit=delete" style="color: black">상품삭제</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<hr style="width:90%;height:2px;border:none;background-color:#5383EC;">