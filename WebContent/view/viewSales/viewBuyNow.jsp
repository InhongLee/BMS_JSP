<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lee.inhong.BMS_JSP.dto.ViewBook" %>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
</head>
<body>

	<% ViewBook bookInfo = (ViewBook) request.getAttribute("bookInfo");
	int point = (int)(bookInfo.getSell_price()*0.05);%>
	
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="viewBuyNow">
			<div id="buyNow_box1">
				<div id="buyNow_box2">
					<img class="img_book" src="<%=request.getContextPath()%>/images/<%=bookInfo.getISBN()%>.jpg" alt="책이미지  200x240" width="200px" height="240px">
				</div>
				<div id="buyNow_box3">
					<div id="buyNow_box4">
						<span id="buyNow_span1"><%=bookInfo.getBook_title()%></span>
						<hr>
						<table id="buyNow_table1">
							<tr>
								<td>정가</td>
								<td><%=bookInfo.getSell_price()%>원</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td><%=bookInfo.getSell_price()%>원</td>
							</tr>
							<tr>
								<td>포인트</td>
								<td><%=point%>점</td>
							</tr>
							<tr>
								<td>저자</td>
								<td><%=bookInfo.getBook_author()%></td>
							</tr>
							<tr>
								<td>출판사</td>
								<td><%=bookInfo.getPublisher_name()%></td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td><%=bookInfo.getISBN()%></td>
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
							<a href="../viewSales/viewCartBuy.jsp">카트 담기</a>
						</div>
						<div id="buyNow_btn2">
							<a href="../viewSales/viewSales.jsp">바로 구매</a>
						</div>
						<div id="buyNow_btn3">
							<a href="../viewMember/viewBoard.jsp">리뷰 쓰기</a>
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