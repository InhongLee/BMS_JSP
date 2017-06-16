<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
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
</body>
</html>