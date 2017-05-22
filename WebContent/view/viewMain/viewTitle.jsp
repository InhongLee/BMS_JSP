<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<div class="title">
	<table style="width:100%">
		<tr>
			<td><h1><a href="<%=request.getContextPath()%>/index.jsp">Book Management System</a></h1></td>
			<td style="font-size:large; font-weight:bold; text-align:right;">
			<%
			String customer_id = (String)session.getAttribute("customer_id");
			if(customer_id != null) {
				out.println(customer_id);%>
				<button style="font-size:large; color:white; background-color:green; border:1px solid green" onclick="window.location='viewLogOut.do';">로그아웃</button>
			<%} else {%>
				<button style="font-size:large; color:white; background-color:green; border:1px solid green" onclick="window.location='viewLogIn.do';">로그인</button>
			<%}%>
			</td>
		</tr>
	</table>
</div>
</body>
</html>