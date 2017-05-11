<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="../../style/styles.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../../JS/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="../../JS/scripts.js"></script>
	<script type="text/javascript" src="../../JS/notice.js"></script>
	<script type="text/javascript" src="../../JS/issue.js"></script>
	<script type="text/javascript" src="../../JS/search.js"></script>
</head>
<body>

	<div class="main_header">
		<div class="title"><h1><a href="../../index.jsp">Book Management System</a></h1></div>
		<jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/>
		<div class="consoleInfo">콘솔정보창</div>
		<jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/>
		<jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/>
	</div>
	
	<div class="main_section">
		<div id="cartBuy_box1">
			<span id="cartBuy_title">카트구매</span>
			<hr>
			<div id="cartBuy_box2">
				<div class="cartBuy_cell1">상품명</div>
				<div class="cartBuy_cell2">정가</div>
				<div class="cartBuy_cell3">판매가</div>
				<div class="cartBuy_cell4">수량</div>
				<div class="cartBuy_cell5">합계</div>
				<div class="cartBuy_cell6">주문</div>
			</div>
			<div class="cartBuy_addBox">
				<div class="cartBuy_cell1"><a href="../viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
				<div class="cartBuy_cell2">35,000원</div>
				<div class="cartBuy_cell3">32,000원</div>
				<div class="cartBuy_cell4">2권</div>
				<div class="cartBuy_cell5">64,000원</div>
				<div class="cartBuy_cell6">
					<div class="cartBuy_btn1">
						<a href="#">구매</a>
					</div>
					<div class="cartBuy_btn2">
						<a href="#">X</a>
					</div>
				</div>
			</div>
			<div class="cartBuy_addBox">
				<div class="cartBuy_cell1"><a href="../viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
				<div class="cartBuy_cell2">35,000원</div>
				<div class="cartBuy_cell3">32,000원</div>
				<div class="cartBuy_cell4">2권</div>
				<div class="cartBuy_cell5">64,000원</div>
				<div class="cartBuy_cell6">
					<div class="cartBuy_btn1">
						<a href="#">구매</a>
					</div>
					<div class="cartBuy_btn2">
						<a href="#">X</a>
					</div>
				</div>
			</div>
			<div class="cartBuy_addBox">
				<div class="cartBuy_cell1"><a href="../viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
				<div class="cartBuy_cell2">35,000원</div>
				<div class="cartBuy_cell3">32,000원</div>
				<div class="cartBuy_cell4">2권</div>
				<div class="cartBuy_cell5">64,000원</div>
				<div class="cartBuy_cell6">
					<div class="cartBuy_btn1">
						<a href="#">구매</a>
					</div>
					<div class="cartBuy_btn2">
						<a href="#">X</a>
					</div>
				</div>
			</div>
			<div class="cartBuy_addBox">
				<div class="cartBuy_cell1"><a href="../viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
				<div class="cartBuy_cell2">35,000원</div>
				<div class="cartBuy_cell3">32,000원</div>
				<div class="cartBuy_cell4">2권</div>
				<div class="cartBuy_cell5">64,000원</div>
				<div class="cartBuy_cell6">
					<div class="cartBuy_btn1">
						<a href="#">구매</a>
					</div>
					<div class="cartBuy_btn2">
						<a href="#">X</a>
					</div>
				</div>
			</div>
			<hr>
			<div id="cartBuy_box3">
				<div id="cartBuy_btn1">
					<a href="../viewSales/viewSales.jsp">일괄 구매</a>
				</div>
				<div id="cartBuy_btn2">
					<a href="../viewSales/viewSales.jsp">카트 비우기</a>
				</div>
				<div id="cartBuy_btn3">
					<a href="../viewSales/viewSales.jsp">계속 쇼핑</a>
				</div>
			</div>
		</div>		
	</div>
	
	<div class="main_footer">
		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>
	</div>
	
</body>
</html>