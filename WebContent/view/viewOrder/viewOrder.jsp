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
</head>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="order_box1">
			<h2 class="title2">주문 관리</h2>
			<hr>
			<div id="order_box2">
				<table id="order_table1">
					<tr>
						<th>OrderId</th>
						<th>BookTitle</th>
						<th>CustomName</th>
						<th>State</th>
						<th>Qty</th>
						<th>Confirm</th>
					</tr>
					<tr id="item1">
						<td>0001</td>
						<td>Headfirst Java</td>
						<td>필N굳</td>
						<td>Req_Perchase</td>
						<td>100</td>
						<td>PENDING</td>
					</tr>
					<tr id="item2">
						<td>0002</td>
						<td>정보처리기사 필기</td>
						<td>이인홍</td>
						<td>Req_Sales</td>
						<td>1</td>
						<td>CONFIRMED</td>
					</tr>
					<tr id="item3">
						<td>0003</td>
						<td>Javascript N jQuery : Missing Menual</td>
						<td>이인홍</td>
						<td>Req_Refund</td>
						<td>1</td>
						<td>REJECTED</td>
					</tr>
					<tr id="item4">
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
					</tr>
				</table>
				<hr>
				<div id="order_box3">
					<div id="order_box3_1">
						<h2 class="title2">총 매출현황</h2>
						<table id="order_table2">
							<tr>
								<td>총 매출액</td>
								<td>+4,100,000</td>
								<td>원</td>
							</tr>
							<tr>
								<td>총 비용</td>
								<td>-3,560,000</td>
								<td>원</td>
							</tr>
							<tr>
								<td>매출 이익</td>
								<td>+540,000</td>
								<td>원</td>
							</tr>
							<tr>
								<td>세금</td>
								<td>-54,000</td>
								<td>원</td>
							</tr>
							<tr>
								<td>순 이익</td>
								<td>+486,000</td>
								<td>원</td>
							</tr>
						</table>
					</div>
					<div id="order_box3_2">
						<ul class="tabs">
							<li><a href="#tab1">구매승인</a></li>
							<li><a href="#tab2">판매승인</a></li>
							<li><a href="#tab3">환불승인</a></li>
						</ul>
						<div class="tab_container">
							<div id="tab1" class="tab_content">
								<form name="order_reqPerchase" action="" method="post">
									<table id="order_table3">
										<tr>
											<td>주문번호</td>
											<td>0001</td>
											<td></td>
										</tr>
										<tr>
											<td>비용/EA</td>
											<td>30,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td>+10</td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 비용</td>
											<td>-300,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="button" value="CONFIRM"></td>
											<td><input type="button" value="REJECT"></td>
										</tr>
									</table>
								</form>
							</div>
							<div id="tab2" class="tab_content">
								<form name="order_reqSales" action="" method="post">
									<table id="order_table4">
										<tr>
											<td>주문번호</td>
											<td>0002</td>
											<td></td>
										</tr>
										<tr>
											<td>단가/EA</td>
											<td>30,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td>-10</td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 판매금액</td>
											<td>+300,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="button" value="CONFIRM"></td>
											<td><input type="button" value="REJECT"></td>
										</tr>
									</table>
								</form>
							</div>
							<div id="tab3" class="tab_content">
								<form name="order_reqRefund" action="" method="post">
									<table id="order_table5">
										<tr>
											<td>주문번호</td>
											<td>0003</td>
											<td></td>
										</tr>
										<tr>
											<td>단가/EA</td>
											<td>30,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td>+10</td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 환불금액</td>
											<td>-300,000</td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="button" value="CONFIRM"></td>
											<td><input type="button" value="REJECT"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	

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
		
		$("#order_table1 td").click(function() {
			var col = $(this).parent().children().index($(this));
			var row = $(this).parent().parent().children().index($(this).parent());
			
			var colName = $("#order_table1 th").eq(col).html();
			var reqState = $(this).parent().children().eq(3).html();
			
			if (colName == "Confirm") {
				var activeTab;
				$("ul.tabs li").removeClass("active");
				if(reqState == "Req_Perchase") {
					$("ul.tabs li:eq(0)").addClass("active");
					$(".tab_content").hide();
					activeTab = $("ul.tabs li:eq(0)").find("a").attr("href");
					$(activeTab).fadeIn();
					$(activeTab + " input[type='button']").focus();
				} else if(reqState == "Req_Sales") {
					$("ul.tabs li:eq(1)").addClass("active");
					$(".tab_content").hide();
					activeTab = $("ul.tabs li:eq(1)").find("a").attr("href");
					$(activeTab).fadeIn();
					$(activeTab + " input[type='button']").focus();
				} else if(reqState == "Req_Refund") {
					$("ul.tabs li:eq(2)").addClass("active");
					$(".tab_content").hide();
					activeTab = $("ul.tabs li:eq(2)").find("a").attr("href");
					$(activeTab).fadeIn();
					$(activeTab + " input[type='button']").focus();
				}
				$(activeTab + " input[type='submit']").focus();
			}
			return false;
		});
	});
</script>
</body>
</html>