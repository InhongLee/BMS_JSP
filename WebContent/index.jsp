<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<head>
	<title>Insert title here</title>
	<script type="text/javascript">
		<%
		session.removeAttribute("customer_id");
		session.removeAttribute("employee_id");
		%>
		setTimeout(function() {window.location='viewSales.do';}, 1000);
	</script>
</head>

<h1>Book Management System에 접속중입니다...</h1>
<body>

</body>
</html>