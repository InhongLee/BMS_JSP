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
		<div id="stock_box1">
			<h2 class="title2">재고 관리</h2>
			<hr>
			<div id="stock_box2">
				<table id="stock_table1">
					<tr>
						<th>BookId</th>
						<th>Title</th>
						<th>Author</th>
						<th>Cost</th>
						<th>Price</th>
						<th>Stock</th>
						<th>Cart</th>
						<th>State</th>
					</tr>
					<tr id="item1">
						<td>0001</td>
						<td>Headfirst Java</td>
						<td>James Gosling</td>
						<td>32000</td>
						<td>25000</td>
						<td>100</td>
						<td>2</td>
						<td>
							<select>
								<option>ON_SALE</option>
								<option>SOLD_OUT</option>
								<option>PENDING</option>
							</select>
						</td>
					</tr>
					<tr id="item2">
						<td>0002</td>
						<td>정보처리기사 필기</td>
						<td>홍봉선 외</td>
						<td>32000</td>
						<td>25000</td>
						<td>0</td>
						<td>0</td>
						<td>SOLD_OUT</td>
					</tr>
					<tr id="item3">
						<td>0003</td>
						<td>HTML5+CSS3 웹 표준의 정석</td>
						<td>고경희</td>
						<td>25000</td>
						<td>28000</td>
						<td>50</td>
						<td>0</td>
						<td>PENDING</td>
					</tr>
					<tr id="item4">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="item5">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<hr>
				<div id="stock_box3">
					<div id="stock_box3_1">
						<h2 class="title2">총 재고현황</h2>
						<table id="stock_table2">
							<tr>
								<td>제품 종류</td>
								<td>3</td>
								<td>EA</td>
							</tr>
							<tr>
								<td>총 수량</td>
								<td>120</td>
								<td>EA</td>
							</tr>
							<tr>
								<td>총 비용</td>
								<td>-3,560,000</td>
								<td>원</td>
							</tr>
							<tr>
								<td>총 재고금액</td>
								<td>+4,100,000</td>
								<td>원</td>
							</tr>
						</table>
					</div>
					<div id="stock_box3_2">
						<ul class="tabs">
							<li><a href="#tab1">구매요청</a></li>
							<li><a href="#tab2">반품요청</a></li>
						</ul>
						<div class="tab_container">
							<div id="tab1" class="tab_content">
								<form name="stock_reqPerchase" action="" method="post">
									<table id="stock_table3">
										<tr>
											<td>비용/EA</td>
											<td>30,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td><input type="number" placeholder="+10"></td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 비용</td>
											<td>-300,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="submit" value="SUBMIT"></td>
											<td><input type="reset" value="RESET"></td>
										</tr>
									</table>
								</form>
							</div>
							<div id="tab2" class="tab_content">
								<form name="stock_reqRefund" action="" method="post">
									<table id="stock_table4">
										<tr>
											<td>비용/EA</td>
											<td>30,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td><input type="number" placeholder="-10"></td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 환불금액</td>
											<td>+300,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="submit" value="SUBMIT"></td>
											<td><input type="reset" value="RESET"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".tab_content").hide();
				$("ul.tabs li:first").addClass("active").show();
				$(".tab_content:first").show();
				
				$("ul.tabs li").click(function() {
					$("ul.tabs li").removeClass("active");
					$(this).addClass("active");
					$(".tab_content").hide();
					var activeTab = $(this).find("a").attr("href");
					$(activeTab).fadeIn();
					return false;
				});
				
				$("#stock_table1 td").click(function() {
					var col = $(this).parent().children().index($(this));
					var row = $(this).parent().parent().children().index($(this).parent());
					
					var colName = $("#stock_table1 th").eq(col).html();
					if(colName == "Title" || colName == "Author" || colName == "Cost" || colName == "Price") {
						var placeholder = $(this).html();
						
						if(placeholder.indexOf("<input") == -1 && placeholder.indexOf("<select") == -1) {
							if(colName == "Title") {
								$(this).html("<input type='text' placeholder='"+placeholder+"'>");
							} else if(colName == "Author") {
								$(this).html("<input type='text' placeholder='"+placeholder+"'>");
							} else if(colName == "Cost") {
								$(this).html("<input type='number' placeholder='"+placeholder+"'>");
							} else if(colName == "Price") {
								$(this).html("<input type='number' placeholder='"+placeholder+"'>");
							}
							$(this).children().focus();
						}
					} else if (colName == "Stock") {
						var activeTab = $(".active").find("a").attr("href");
						$(activeTab + " input[type='number']").focus();
					}
					return false;
				});
				
				$("#stock_table1 td").on("keyup", function(key) {
					if(key.keyCode == 13) {
						key.preventDefault();
						key.stopPropagation();
						var cellValue = $(this).children().val();
						if(cellValue == "") {
							cellValue = $(this).children().attr("placeholder");
						}
						$(this).html(cellValue);
					}
					return false;
				});
			});
		</script>
	</div>
	
	<div class="main_footer">
		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>
	</div>
	
</body>
</html>