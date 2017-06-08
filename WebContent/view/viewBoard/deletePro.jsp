<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<h2>deletePro.jsp</h2>
			<c:if test="${selectCnt ==1}">
				<c:if test="${deleteCnt == 1}">
					<script type="text/javascript">
						alert("글이 삭제되었습니다.");
						window.location="viewBoard.do?pageNum=${pageNum}";
					</script>
				</c:if>
				<c:if test="${deleteCnt == -1}">
					<script type="text/javascript">
						alert("답글이 있는 경우 삭제할 수 없습니다.");
						window.location="viewBoard.do?pageNum=${pageNum}";
					</script>
				</c:if>
				<c:if test="${deleteCnt == 0}">
					<script type="text/javascript">
						alert("삭제를 실패하였습니다.");
						window.location="viewBoard.do?pageNum=${pageNum}";
					</script>
				</c:if>
			</c:if>
			<c:if test="${selectCnt ==0}">
				<script type="text/javascript">
					errorAlert(passwdError);
				</script>
			</c:if>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
	
</body>
</html>