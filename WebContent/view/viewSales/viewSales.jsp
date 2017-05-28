<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lee.inhong.BMS_JSP.dto.ViewBook" %>

<html>
<body>
	<% ArrayList<ViewBook> bookList = (ArrayList<ViewBook>)request.getAttribute("bookList");%>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="issue" class="issue">
			<strong>화제의 책</strong>
			<hr>
			<div class="open-event" style="width:100%;">
				<ul class="book-list">
					<%for(int i=0; i<bookList.size(); i++) {
						ViewBook dto = bookList.get(i);
						String ISBN 			= dto.getISBN();
						int publisher_id 		= dto.getPublisher_id();
						String book_title 		= dto.getBook_title();
						String book_author 		= dto.getBook_author();
						int sell_price 			= dto.getSell_price();
						String publisher_name	= dto.getPublisher_name();%>
						<li >
							<img class="img_book" src="<%=request.getContextPath() %>/images/<%=ISBN%>.jpg" alt="책이미지  200x240"
							onclick="window.location='viewBuyNow.do?ISBN='+<%=ISBN%>">
							<div class="bookTitle"><%=book_title%></div>
							<div class="bookComment">간략한 묘사</div>
							<div class="bookPrice"><%=sell_price%>원</div>
							<div class="bookAuthor"><%=book_author%> | <%=publisher_name%></div>
						</li>
					<%}%>
				</ul>
				<span id="btn_issue">
					<a href="#" class="prev"><img src="<%=request.getContextPath() %>/images/icon_arrow_left.png" alt="Prev"></a>
					<a href="#" class="next"><img src="<%=request.getContextPath() %>/images/icon_arrow_right.png" alt="Next"></a>
				</span>
			</div>
			<script type="text/javascript">fn_issue('btn_issue','issue')</script>
		</div>
		
		<div id="bestseller" class=issue>
			<strong>이달의 베스트셀러</strong>
			<hr>
			<div class="open-event" style="width:100%;">
				<ul class="book-list">
					<%for(int i=0; i<bookList.size(); i++) {
						ViewBook dto = bookList.get(i);
						String ISBN 			= dto.getISBN();
						int publisher_id 		= dto.getPublisher_id();
						String book_title 		= dto.getBook_title();
						String book_author 		= dto.getBook_author();
						int sell_price 			= dto.getSell_price();
						String publisher_name	= dto.getPublisher_name();%>
						<li >
							<img class="img_book" src="<%=request.getContextPath() %>/images/<%=ISBN%>.jpg" alt="책이미지  200x240"
							onclick="window.location='viewBuyNow.do?ISBN='+<%=ISBN%>">
							<div class="bookTitle"><%=book_title%></div>
							<div class="bookComment">간략한 묘사</div>
							<div class="bookPrice"><%=sell_price%>원</div>
							<div class="bookAuthor"><%=book_author%> | <%=publisher_name%></div>
						</li>
					<%}%>
				</ul>
				<span id="btn_bestseller">
					<a href="#" class="prev"><img src="<%=request.getContextPath() %>/images/icon_arrow_left.png" alt="Prev"></a>
					<a href="#" class="next"><img src="<%=request.getContextPath() %>/images/icon_arrow_right.png" alt="Next"></a>
				</span>
			</div>
			<script type="text/javascript">fn_issue('btn_bestseller','bestseller')</script>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>