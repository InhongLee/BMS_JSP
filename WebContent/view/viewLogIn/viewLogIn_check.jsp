<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<script type="text/javascript">
	if(${requestScope.cnt == 1}) {setTimeout(function() {window.location='viewSales.do';}, 1000);}
	else if(${requestScope.cnt == 0}) {setTimeout(function() {window.location='viewLogIn.do';}, 1000);}
</script>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<c:if test="${requestScope.cnt == 1}">
				<h1>${sessionScope.customer_id} 님 환영합니다.</h1>
				<p>잠시후 메인페이지로 이동합니다.</p>
			</c:if>
			<c:if test="${requestScope.cnt != 1}">
				<h1>로그인에 실패하였습니다.</h1>
				<p>잠시후 로그인페이지로 돌아갑니다.</p>
			</c:if>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>