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
				<div id="title_btn1">
					<input class="inputButton fontSizeL" type="button" value="로그아웃" 
					onclick="window.location='viewLogOut.do';">
				</div>
			</c:if>
			<c:if test="${sessionScope.customer_id == null}">
				<div id="title_btn2">
					<input class="inputButton fontSizeL" type="button" value="로그인"
					onclick="window.location='viewLogIn.do';">
				</div>	
			</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>