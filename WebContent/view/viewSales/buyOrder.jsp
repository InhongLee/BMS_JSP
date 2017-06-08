<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/setting.jsp" %>
<html>
<script type="text/javascript">
	if(${cnt == 1}) {setTimeout(function() {window.location='viewSales.do';}, 1000);}
	else if(${cnt == 0}) {setTimeout(function() {window.history.back();}, 1000);}
</script>
<body>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5">
			<td>
				<c:if test="${cnt == 1}">
					<h1>구매요청을 접수하였습니다.</h1>
					<h1>제품이 준비되는대로 발송예정입니다.</h1>
				</c:if>
				<c:if test="${cnt == 0}">
					<h1>구매요청 중에 오류가 발생하였습니다.</h1>
					<h1>잠시 후 다시 시도해주세요.</h1>
				</c:if>
			</td>
		</tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>