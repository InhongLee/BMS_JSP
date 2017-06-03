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
		<div id="stock_box1">
			<form action="stockOpSearch.do" method="post" name="stockOpSearchForm">
				<table id="stock_Options">
					<tr>
						<th>
							<h2 class="title2">재고 관리</h2>						
						</th>
						<th>
							<select class="input fontSizeM" name="searchPublisher">
								<option value="0">출판사 선택</option>
								<c:forEach var="publisher" items="${publishers}">
									<option value="${publisher.publisher_id}">${publisher.publisher_name}</option>
								</c:forEach>
							</select>
						</th>
						<th>
							<select class="input fontSizeM" name="searchStockState">
								<option value="0">재고상태 선택</option>
								<option value="S">ON_SALE</option>
								<option value="P">PENDING</option>
								<option value="O">SOLD_OUT</option>
							</select>
						</th>
						<th>
							<input class="input fontSizeM" type="number" name="searchStockQty" min="0" placeHolder="재고량 기준 입력">
						</th>
						<th><input class="inputButton fontSizeM" type="submit" value="검색"></th>
						<th><input class="inputButton fontSizeM orange" type="button" value="검색초기화" onclick="stockOpReset();"></th>
					</tr>
				</table>
			</form>
			<hr>
			<div id="stock_box2">
				<div class="scrollBox">
					<table id="stock_table1">
						<tr>
							<th>ISBN</th>
							<th>Title</th>
							<th>Author</th>
							<th>Cost</th>
							<th>Price</th>
							<th>Stock</th>
							<th>State</th>
						</tr>
						<c:forEach var="dto" items="${dtos}">
							<tr id="item1">
							<td>${dto.ISBN}</td>
							<td>${dto.book_title}</td>
							<td>${dto.book_author}</td>
							<td>${dto.purchase_price}</td>
							<td>${dto.sell_price}</td>
							<td>${dto.stock}</td>
							<td>
								<c:choose>
									<c:when test="${dto.stock_state == 'O'}">SOLD_OUT</c:when>
									<c:when test="${dto.stock_state == 'P'}">PENDING</c:when>
									<c:when test="${dto.stock_state == 'S'}">ONSALE</c:when>
									<c:otherwise>ERROR</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>		
				<hr>
				<div id="stock_box3">
					<div id="stock_box3_1">
						<h2 class="title2">총 재고현황</h2>
						<table id="stock_table2">
							<tr><td>제품 종류</td>
								<td>${cnt}</td><td>종</td></tr>
							<tr><td>총 수량</td>
								<td>${stockInfo.EATotal}</td><td>EA</td></tr>
							<tr><td>총 구매금액</td>
								<td>${stockInfo.buyTotal}</td><td>원</td></tr>
							<tr><td>총 재고금액</td>
								<td>${stockInfo.sellTotal}</td><td>원</td></tr>
						</table>
					</div>
					<div id="stock_box3_2">
						<ul class="tabs">
							<li><a href="#tab1">구매요청</a></li>
							<li><a href="#tab2">반품요청</a></li>
						</ul>
						<div class="tab_container">
							<div id="tab1" class="tab_content">
								<form action="" method="post" name="stock_reqPerchase"
								onsubmit="">
									<table id="stock_table3">
										<tr>
											<td>비용/EA</td>
											<td id="stock_t3_cost">0</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td><input type="number" id="reqQty" name="reqQty" maxlength="4"
											onkeyup="totalCostChk();"></td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 비용</td>
											<td>0</td>
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
											<td>0</td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td><input type="number" placeholder="-10"></td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 환불금액</td>
											<td>0</td>
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
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			console("updateSuccess");
		</script>
	</c:if>
</body>
</html>