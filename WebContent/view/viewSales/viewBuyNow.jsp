<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<%@ page import="lee.inhong.BMS_JSP.dto.ViewBook" %>

<html>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="viewBuyNow">
			<div id="buyNow_box1">
				<div id="buyNow_box2">
					<img class="img_book" src="${project}images/${requestScope.bookInfo.ISBN}.jpg"
					alt="책이미지  200x240" width="200px" height="240px">
				</div>
				<div id="buyNow_box3">
					<div id="buyNow_box4">
						<span id="buyNow_span1">${requestScope.bookInfo.book_title}</span>
						<hr>
						<table id="buyNow_table1">
							<tr><td>정가</td>	<td>${requestScope.bookInfo.sell_price}원</td>
							</tr>
							<tr><td>판매가</td><td>${requestScope.bookInfo.sell_price}원</td>
							</tr>
							<tr><td>포인트</td><td>${requestScope.point}점</td>
							</tr>
							<tr><td>저자</td><td>${requestScope.bookInfo.book_author}</td>
							</tr>
							<tr><td>출판사</td><td>${requestScope.bookInfo.publisher_name}</td>
							</tr>
							<tr><td>ISBN</td><td>${requestScope.bookInfo.ISBN}</td>
							</tr>
							<tr>
								<td>판매지수</td>
								<td>104</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><label for="buyNum">주문수량</label></td>
								<td><input name="buyNum" id="buyNum" type="number" placeholder="1"></td>
							</tr>
						</table>
					</div>
					<div id="buyNow_box5">
						<div id="buyNow_btn1">
							<input class="inputButton fontSizeM" type="button" value="카트담기"
							onclick="window.location='viewCartBuy.do?ISBN='+${requestScope.bookInfo.ISBN}"></div>
						<div id="buyNow_btn2">
							<input class="inputButton fontSizeM blue" type="button" value="바로구매"
							onclick="window.location='viewSales.do'"></div>
						<div id="buyNow_btn3">
							<input class="inputButton fontSizeM orange" type="button" value="리뷰쓰기"
							onclick="window.location='viewBoard.do'">
						</div>
					</div>
				</div>
			</div>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>