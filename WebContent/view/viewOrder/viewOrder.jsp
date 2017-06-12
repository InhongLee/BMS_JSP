<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<html>
<body>
	<c:if test="${confirmCnt == 0}">
		<script type="text/javascript">
			errorAlert(orderIdNotExist);
		</script>
	</c:if>
	<c:if test="${confirmCnt == -1}">
		<script type="text/javascript">
			errorAlert(orderStocklack);
		</script>
	</c:if>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="order_box1">
			<form action="ordreOpSearch.do" method="post" name="orderOpSearchForm"
			onsubmit="return fnOrderOpSearch();">
				<table id ="order_Options">
					<tr><th><h2 class="title2">주문 관리</h2></th>
						<th>
							<input class="input fontSizeM" type="text" name="searchTitleAuthor" placeHolder="책제목 검색">
						</th>
						<th><input class="input" type="date" name="order_StartDate"></th>
						<th>~</th>
						<th><input class="input" type="date" name="order_EndDate"></th>
						<th>
							<select class="input fontSizeM" name="selectOrderType">
								<option value="0">주문종류 선택</option>
								<option value="PU">Purchase</option>
								<option value="SE">Sales</option>
							</select>
						</th>
						<th>
							<select class="input fontSizeM" name="selectOrderState">
								<option value="0">주문상태 선택</option>
								<optgroup label="PURCHASE">
									<option value=1110>REQ_PURCHASE</option>
									<option value=1120>APP_PURCHASE</option>
									<option value=1130>REJ_PURCHASE</option>
									<option value=1210>REQ_RETURN</option>
									<option value=1220>APP_RETURN</option>
									<option value=1230>REJ_RETURN</option>
								</optgroup>
								<optgroup label="SALES">
									<option value=2110>REQ_SALES</option>
									<option value=2120>APP_SALES</option>
									<option value=2130>REJ_SALES</option>
									<option value=2210>REQ_REFUND</option>
									<option value=2220>APP_REFUND</option>
									<option value=2230>REJ_REFUND</option>
								</optgroup>
							</select>
						</th>
						<th><input class="inputButton fontSizeM" type="submit" value="검색"></th>
						<th><input class="inputButton fontSizeM orange" type="button" value="검색초기화" onclick="orderOpReset();"></th>
				</table>
				
			</form>
			<hr>
			<div id="order_box2">
				<div class="scrollBox">
					<div id="listOrder">
						<table id="order_table1">
							<tr>
								<th>order_id</th>
								<th>detail_number</th>
								<th>book_title</th>
								<th>order_type</th>
								<th>purchase_price</th>
								<th>sell_price</th>
								<th>stock</th>
								<th>order_quantity</th>
								<th>order_state</th>
								
							</tr>
							<c:forEach var="dto" items="${dtos}">
								<tr id="item1">
									<td>${dto.order_id}</td>
									<td>${dto.detail_number}</td>
									<td>${dto.book_title}</td>
									<td>
										<c:choose>
											<c:when test="${fn:substring(dto.order_id,0,2) == 'PU'}">
												PURCHASE
											</c:when>									
											<c:when test="${fn:substring(dto.order_id,0,2) == 'SE'}">
												SALES
											</c:when>
											<c:otherwise>ERROR</c:otherwise>
										</c:choose>
									</td>
									<td>${dto.purchase_price}</td>
									<td>${dto.sell_price}</td>
									<td>${dto.stock}</td>
									<td>${dto.order_quantity}</td>
									<td id="${dto.order_state}">${dto.order_stateName}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<hr>
				<div id="order_box3">
					<div id="order_box3_1">
						<h2 class="title2">총 매출현황</h2>
						<table id="order_table2">
							<tr>
								<td>매출총액/월</td>
								<td>+ ${totalSales}</td>
								<td>원</td>
							</tr>
							<tr>
								<td>비용총액/월</td>
								<td>- ${totalCost}</td>
								<td>원</td>
							</tr>
							<tr>
								<td>매출이익/월</td>
								<td>${salesProfit}</td>
								<td>원</td>
							</tr>
							<tr>
								<td>세금</td>
								<td>- ${tax}</td>
								<td>원</td>
							</tr>
							<tr>
								<td>순이익/월</td>
								<td>${netProfit}</td>
								<td>원</td>
							</tr>
						</table>
					</div>
					<div id="order_box3_2">
						<ul class="tabs">
							<li><a href="#tab1">구매</a></li>
							<li><a href="#tab2">판매</a></li>
							<li><a href="#tab3">환불</a></li>
							<li><a href="#tab4">반품</a></li>
						</ul>
						<div class="tab_container">
							<c:forEach var="i" begin="1" end="4" step="1">
								<div id="tab${i}" class="tab_content">
								<form action="confirmOrder.do" method="post" id="orderReqForm" name="order_req${i}"
								onsubmit="return confirmCheck('order_req${i}');">
									<table id="order_table3">
										<tr>
											<td>주문번호</td>
											<td id="order_orderId">
											</td><td></td>
										</tr>
										<tr>
											<td>비용/EA</td>
											<td id="order_price"></td>
											<td>원</td>
										</tr>
										<tr>
											<td>요청수량</td>
											<td id="order_orderQty"></td>
											<td>EA</td>
										</tr>
										<tr>
											<td>총 비용</td>
											<td id="order_orderSum"></td>
											<td>원</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="submit" value="CONFIRM"></td>
											<td><input type="button" value="REJECT"
											onclick="rejectOrder('order_req${i}');"></td>
										</tr>
									</table>
									<input type="hidden" name="order_id" value="">
									<input type="hidden" name="order_state" value="">
								</form>
							</div>
							</c:forEach>
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