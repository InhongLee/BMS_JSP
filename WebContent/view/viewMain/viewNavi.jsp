<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navi">
		<ul>
			<li id="sales"><span class="menuName">sales</span>
				<ul class="sub_menu" id="sub_sales">
					<li><a href="../viewSales/viewCartBuy.jsp">장바구니</a></li>
				</ul>
			</li>
			<li id="stock"><span class="menuName">stock</span>
				<ul class="sub_menu" id="sub_stock">
					<li><a href="../viewStock/viewStock.jsp">재고관리</a></li>
				</ul>					
			</li>
			<li id="order"><span class="menuName">order</span>
				<ul class="sub_menu" id="sub_order">
					<li><a href="../viewOrder/viewOrder.jsp">주문관리</a></li>
				</ul>				
			</li>
			<li id="member"><span class="menuName">member</span>
				<ul class="sub_menu" id="sub_member">
					<li><a href="../viewMember/viewMemberInfo.jsp">마이페이지</a></li>
				</ul>				
			</li>
		</ul>
	</div>	
</body>
</html>