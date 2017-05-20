<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
</head>
<body>
	<h3>중복확인페이지</h3>
	<%
		String customer_id = (String) request.getAttribute("customer_id");
		int cnt = (Integer) request.getAttribute("cnt");
	%>
	<form action="confirmId.do" method="post" name="form_confirm" onsubmit="return confirmIdCheck();">
		<%if(cnt == 1) {%>
			<table>
				<tr>
					<th colspan="2"><span><%=customer_id %></span>는 사용할 수 없습니다.	</th>
				</tr>
				<tr>
					<th>아이디: </th>
					<td><input type="text" name="customer_id" maxlength="20" style="width:100px"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="self.close();">
					</th>
				</tr>
			</table>
		<%} else if(cnt == 0) {%>
			<table>
				<tr>
					<td align="center"><span><%=customer_id %></span>는 사용할 수 있습니다.</td>
				</tr>
				<tr>
					<th><input type="button" value="확인" onclick="setId('<%=customer_id%>');"></th>
				</tr>
			</table>
		<%}%>
	</form>
	
</body>
</html>