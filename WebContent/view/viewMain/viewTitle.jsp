<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
<div class="title">
	<table style="width:100%">
		<tr>
			<td><h1><a href="${project}index.jsp">Book Management System</a></h1></td>
			<td style="font-size:large; font-weight:bold; text-align:right;">
			<c:if test="${sessionScope.customer_id != null}">
				${sessionScope.customer_id}
				<button style="font-size:large; color:white; background-color:green; border:1px solid green"
				onclick="window.location='viewLogOut.do';">로그아웃</button>
			</c:if>
			<c:if test="${sessionScope.customer_id == null}">
				<button style="font-size:large; color:white; background-color:green; border:1px solid green" 
				onclick="window.location='viewLogIn.do';">로그인</button>
			</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>