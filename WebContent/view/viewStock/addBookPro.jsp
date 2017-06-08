<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/view/setting.jsp" %>
<html>
<body>
	<div style="height:400px; text-align: center;">
		<c:if test="${cnt == 1}">
		<h1>책 등록에 성공하였습니다.</h1>
	</c:if>
	<c:if test="${cnt == 0}">
		<h1>책 등록에 실패하였습니다.</h1>
	</c:if>
	<button onclick="window.close();">확인</button>
	</div>
</body>
</html>