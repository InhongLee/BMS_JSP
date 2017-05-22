<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript">
	var result = <%=(Integer) request.getAttribute("cnt")%>;
	if(result == 1) {setTimeout(function() {window.location='viewSales.do';}, 1000);}
	else if(result == 0) {setTimeout(function() {window.location='viewSignOut.do';}, 1000);}
	
</script>
</head>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<%
				if((Integer)request.getAttribute("cnt") == 1) {
					session.removeAttribute("customer_id");%>
					<h1>회원 탈퇴 처리가 완료되었습니다.</h1>
					<p>잠시후 메인페이지로 이동합니다.</p>
			<%	} else { %>
					<h1>회원 탈퇴 처리가 실패하였습니다.</h1>
					<p>지속적으로 실패가 발생한다면 안정적인 처리를 위해 아래의 담당자에게 연락을 남겨주세요.<br>
					담당자 연락처 : amaco78@gmail.com<br>
					잠시후 회원탈퇴페이지로 돌아갑니다.</p>
			<% 	} %>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>