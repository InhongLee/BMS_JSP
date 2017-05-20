<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lee.inhong.BMS_JSP.dto.Customer" %>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
</head>
<body>

	<%
	/* 입력받은 값을 받아온다. (한글 인코딩 처리) */
	Customer customerInfo = (Customer) request.getAttribute("customerInfo");
	session.setAttribute("customerInfo", customerInfo);
	%>

	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<form action="viewSignIn_result.do" method="post">
				<fieldset>
					<legend>회원약관</legend>
					<hr>
					<p>1. 회원정보는 웹사이트의 운영정보를 위해서만 사용됩니다.</p>
					<p>2. 웹사이트의 정상운영을 방해하는 회원은 탈퇴처리합니다.</p>
					<hr>
					<P>위의 약관에 동의하십니까?
					<input type="radio" name="agree" value="YES">동의함&nbsp;
					<input type="radio" name="agree" value="NO" checked>동의안함&nbsp;</P>
					<input type="submit" value="확인">
				</fieldset>
			</form>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>

</body>
</html>