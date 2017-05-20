<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript">
	var result = <%=(Integer) request.getAttribute("cnt")%>;
	setTimeout(function() {window.location='viewMemberInfo.do';}, 1000);
</script>
</head>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<%
				String customer_id = request.getParameter("customer_id");
				if((Integer)request.getAttribute("cnt") == 1) {%>
					<h1>회원정보 수정을 완료했습니다.</h1>
					<p>잠시후 내정보 페이지로 이동합니다.</p>
			<%	} else { %>
					<h1>회원정보 수정을 실패하였습니다.</h1>
					<p>잠시후 내정보 페이지로 이동합니다.</p>
			<% 	} %>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>