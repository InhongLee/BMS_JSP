<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<head>
<script type="text/javascript">
	setTimeout(function() {window.location='viewLogIn.do';}, 1000);
</script>
</head>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<c:if test="${requestScope.cnt == 1}">
				<h1>회원가입에 성공하였습니다.</h1>
				<p>잠시후 로그인페이지로 이동합니다.</p>
			</c:if>
			<c:if test="${requestScope.cnt == 0}">
				<h1>회원가입에 실패하였습니다.</h1>
				<p>잠시후 로그인페이지로 돌아갑니다.</p>
			</c:if>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>