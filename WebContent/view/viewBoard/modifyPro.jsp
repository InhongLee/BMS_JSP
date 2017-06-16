<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
	<c:if test="${cnt == 0}">
		<script type="java/script">
			errorAlert(updateError);
		</script>
	</c:if>
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("글이 수정되었습니다.");
			window.location="viewBoard.do?pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>