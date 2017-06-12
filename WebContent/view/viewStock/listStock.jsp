<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<body>
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
					<c:when test="${dto.stock_state == 3110}">PENDING</c:when>
					<c:when test="${dto.stock_state == 3120}">ON_SALE</c:when>
					<c:when test="${dto.stock_state == 3130}">SOLD_OUT</c:when>
					<c:when test="${dto.stock_state == 3140}">OUT_OF_PRINT</c:when>
					<c:otherwise>ERROR</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
