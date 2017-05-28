<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<script type="text/javascript">
	if(${requestScope.cnt == 1}) {setTimeout(function() {window.location='viewSales.do';}, 1000);}
	else if(${requestScope.cnt == 0}) {setTimeout(function() {window.location='viewSignOut.do';}, 3000);}	
</script>

<html>
<head>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<c:if test="${requestScope.cnt == 1}">
				<h1>회원 탈퇴 처리가 완료되었습니다.</h1>
				<p>잠시후 메인페이지로 이동합니다.</p>
			</c:if>
			<c:if test="${requestScope.cnt == 0}">
				<h1>회원 탈퇴 처리가 실패하였습니다.</h1>
				<p>지속적으로 실패가 발생한다면 안정적인 처리를 위해 아래의 담당자에게 연락을 남겨주세요.<br>
				담당자 연락처 : amaco78@gmail.com<br>
				잠시후 회원탈퇴페이지로 돌아갑니다.</p>
			</c:if>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>