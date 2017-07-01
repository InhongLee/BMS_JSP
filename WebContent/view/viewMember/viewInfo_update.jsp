<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<script type="text/javascript">
	setTimeout(function() {window.location='viewMemberInfo.do';}, 1000);
</script>

<html>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<c:if test="${requestScope.cnt == 1}">
				<h1>회원정보 수정을 완료했습니다.</h1>
				<p>잠시후 내정보 페이지로 이동합니다.</p>
			</c:if>
			<c:if test="${requestScope.cnt == 0}">
				<h1>회원정보 수정을 실패하였습니다.</h1>
				<p>이메일을 정확하게 입력하셨는지 확인하세요.<br>잠시후 내정보 페이지로 이동합니다.</p>
			</c:if>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>