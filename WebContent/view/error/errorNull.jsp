<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<html>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<h2>서비스 처리 과정에서 널(NULL) 에러가 발생하였습니다.</h2>
			<button onclick="window.history.back();">돌아가기</button>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
	
</body>
</html>