<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/notice.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/issue.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/search.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("td").eq(0).css("width","120px");
	});
	$("#buyNow_box5 a").click(function() {
		var url = $(this).attr('href');
		$('#section01').load(url);
		return false;
	});
</script>
</head>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="viewBuyNow">
			<div id="buyNow_box1">
				<div id="buyNow_box2">
					<img class="img_book" src="../../images/HeadFirst_Java.jpg" alt="책이미지  200x240" width="200px" height="240px">
				</div>
				<div id="buyNow_box3">
					<div id="buyNow_box4">
						<span id="buyNow_span1">Headfirst Java</span>
						<hr>
						<table id="buyNow_table1">
							<tr>
								<td>정가</td>
								<td>35,000 원</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td>32,000 원</td>
							</tr>
							<tr>
								<td>포인트</td>
								<td>600 원</td>
							</tr>
							<tr>
								<td>출간일</td>
								<td>2017년 04월 28일</td>
							</tr>
							<tr>
								<td></td>
								<td>372쪽 | 600g | 152*200*30㎜</td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td>9791186137475</td>
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