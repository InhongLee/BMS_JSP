<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
<h2><center>글쓰기 - 처리페이지</center></h2>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>
<c:if test="${cnt != 0}"> <!-- 글쓰기 성공 -->
	<c:redirect url="viewBoard.do"/>
</c:if>
</body>
</html>