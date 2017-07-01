<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/setting.jsp" %>
<html>
<script type="text/javascript">
	setTimeout(function() {window.location='viewSales.do';}, 1000);
</script>
<body>
<table class="mainFrame">
	<tr class="mainRow1"><td><jsp:include 
	page="/view/viewMain/viewTitle.jsp"		
	flush="false"/></td></tr>
	<tr class="mainRow2"><td><jsp:include 
	page="/view/viewMain/viewNavi.jsp" 
	flush="false"/></td></tr>
	<tr class="mainRow3"><td><jsp:include 
	page="/view/viewMain/viewRollUpNews.jsp" 
	flush="false"/></td></tr>
	<tr class="mainRow4"><td><jsp:include 
	page="/view/viewMain/viewSearch.jsp" 
	flush="false"/></td></tr>
	<tr class="mainRow5"><td>
		<div>
			<h2>총  ${check} 권의 책을 구매요청하였습니다.</h2>
		</div>
	</td></tr>
	<tr class="mainRow6"><td>
	<div class="consoleInfo">콘솔정보창</div></td></tr>
	<tr class="mainRow7"><td>
	<jsp:include page="/view/viewMain/viewFooter.jsp" 
	flush="false"/></td></tr>
</table>
</body>
</html>