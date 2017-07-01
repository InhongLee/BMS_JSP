<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<body>
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
</body>
