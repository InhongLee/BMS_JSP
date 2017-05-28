<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<html>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="cartBuy_box1">
			<span id="cartBuy_title">카트구매</span>
			<hr>
			<div id="cartBuy_box2">
				<div class="cartBuy_cell1">상품명</div>
				<div class="cartBuy_cell2">저자</div>
				<div class="cartBuy_cell3">출판사</div>
				<div class="cartBuy_cell5">가격</div>
				<div class="cartBuy_cell6">주문</div>
			</div>
			<c:forEach var="bookInfos" items="${requestScope.bookInfos}">
				<div class="cartBuy_addBox">
					<div class="cartBuy_cell1">
					<a href="viewBuyNow.do?ISBN=${bookInfos.ISBN}">${bookInfos.book_title}</a></div>
					<div class="cartBuy_cell2">${bookInfos.book_author}</div>
					<div class="cartBuy_cell3">${bookInfos.publisher_name}</div>
					<div class="cartBuy_cell5">${bookInfos.sell_price}원</div>
					<div class="cartBuy_cell6">
						<div class="cartBuy_btn1">
							<input class="inputButton fontSizeM" type="button" value="구매"
							onclick="#">
						</div>
						<div class="cartBuy_btn2">
							<input class="inputButton fontSizeM red" type="button" value="X"
							onclick="window.location='deSelectCart.do?ISBN='+${bookInfos.ISBN}">
						</div>
					</div>
				</div>
			</c:forEach>
			<hr>
			<div id="cartBuy_box3">
				<div id="cartBuy_btn1">
					<input class="inputButton fontSizeM" type="button" value="카트비우기"
					onclick="window.location='deSelectCartAll.do'">
				</div>
				<div id="cartBuy_btn2">
					<input class="inputButton fontSizeM orange" type="button" value="계속쇼핑"
					onclick="window.location='viewSales.do'">
				</div>
			</div>
		</div>	
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
</body>
</html>