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
		<div id="issue" class="issue">
			<strong>화제의 책</strong>
			<hr>
			<div class="open-event" style="width:100%;">
				<ul class="book-list">
					<c:forEach var="dto" items="${bookList}">
						<li>
							<img class="img_book" src="${project}images/${dto.ISBN}.jpg" alt="책이미지 200x240"
							onclick="window.location='viewBuyNow.do?ISBN=${dto.ISBN}'">
							<div class="bookTitle">${dto.book_title}</div>
							<div class="bookComment">간략한 묘사</div>
							<div class="bookPrice">${dto.sell_price}원</div>
							<div class="bookAuthor">${dto.book_author} | ${dto.publisher_name}</div>
						</li>
					</c:forEach>
				</ul>
				<span id="btn_issue">
					<a href="#" class="prev"><img src="${project}images/icon_arrow_left.png" alt="Prev"></a>
					<a href="#" class="next"><img src="${project}images/icon_arrow_right.png" alt="Next"></a>
				</span>
			</div>
			<script type="text/javascript">fn_issue('btn_issue','issue')</script>
		</div>
		
		<div id="bestseller" class=issue>
			<strong>이달의 베스트셀러</strong>
			<hr>
			<div class="open-event" style="width:100%;">
				<ul class="book-list">
					<c:set var="i" value="0"/>
					<c:forEach var="dto" items="${bestSeller}">
						<c:set var="i" value="${i+1}"></c:set>
						<li>
							<img class="img_book" src="${project}images/${dto.ISBN}.jpg" alt="책이미지 200x240"
							onclick="window.location='viewBuyNow.do?ISBN=${dto.ISBN}'">
							<div class="bookTitle">No.${i}. ${dto.book_title}</div>
							<div class="bookComment">간략한 묘사</div>
							<div class="bookPrice">${dto.sell_price}원</div>
							<div class="bookAuthor">${dto.book_author} | ${dto.publisher_name}</div>
						</li>
					</c:forEach>
				</ul>
				<span id="btn_bestseller">
					<a href="#" class="prev"><img src="${project}images/icon_arrow_left.png" alt="Prev"></a>
					<a href="#" class="next"><img src="${project}images/icon_arrow_right.png" alt="Next"></a>
				</span>
			</div>
			<script type="text/javascript">fn_issue('btn_bestseller','bestseller')</script>
		</div>
		
		<div id="booklistBox" class="scrollBox400">
			<table id="booklist" >
				<tr>
					<th colspan="3">
						■■■■ BOOK LIST ■■■■
					</th>
				</tr>
				<tr>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
				</tr>
				<c:forEach var="dto" items="${bookList}">
				<tr>
					<td><a href="viewBuyNow.do?ISBN=${dto.ISBN}">${dto.book_title}</a></td>
					<td>${dto.book_author}</td>
					<td>${dto.publisher_name}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>