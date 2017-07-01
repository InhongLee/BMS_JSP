<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/view/setting.jsp" %>
<html>
<body>

<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<span id="board_title">리뷰</span>
			<hr>
			<div id="board_box1">
				<div id="board_box2">
					<div class="board_cell1">상품명</div>
					<div class="board_cell2">등록일자</div>
					<div class="board_cell3">내용</div>
					<div class="board_cell4">점수</div>
					<div class="board_cell5">작성자</div>
				</div>
				<div  class="scrollBox">
					<c:forEach var="review" items="${dtos}">
						<div class="board_addBox">
							<div class="board_cell1"><a href="viewBuyNow.do?ISBN=${review.ISBN}">${review.book_title}</a></div>
							<div class="board_cell2">${review.reg_date}</div>
							<div class="board_cell3">${review.content}</div>
							<div class="board_cell4">
							<c:forEach var="i" begin="1" end="5">
								<c:if test="${review.starpoint >= i}">
									★
								</c:if>
								<c:if test="${review.starpoint < i}">
									☆
								</c:if>
							</c:forEach>
							</div>
							<div class="board_cell5">${review.customer_id}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="board_box3">
				<form action="reviewPro.do" method="post" name="reviewform">
					<span style="float:left;" id="board_title">나의 리뷰</span>
					<span style="float:right;" >
						<input type="submit" name="btn_review" value="리뷰등록">
						<input type="reset" name="btn_reset" value="다시쓰기">
					</span>
					<hr style="clear:both;">
					<div id="board_box4">
						<textarea name="content">당신의 리뷰를 적어주세요.</textarea>
					</div>
					<div id="board_box5">
						<span id="board_title">별점</span>
						<div id="board_box6">
							<a href="1" id="board_star1">☆</a>
							<a href="2" id="board_star2">☆</a>
							<a href="3" id="board_star3">☆</a>
							<a href="4" id="board_star4">☆</a>
							<a href="5" id="board_star5">☆</a>
						</div>
					</div>
					<input type="hidden" name="ISBN" value="${dto.ISBN}">
					<input type="hidden" name="starpoint"	value="">
					
				</form>
			</div>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
<script type="text/javascript">
$(document).ready(function() {
	$("#board_box6 a").click(function() {
		var starNum = $(this).attr("href");
		for(var i=1; i<6; i++) {
			if(starNum >= i) {$("#board_star"+i).html("★");}
			else {$("#board_star"+i).html("☆");}
		}
		$("form[name=reviewform] input[name=starpoint]").val(starNum);
		return false;
	});	
});

</script>
</body>
</html>