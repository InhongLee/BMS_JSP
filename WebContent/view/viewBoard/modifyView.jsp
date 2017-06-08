<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body  onload="modifyFocus();">
	
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<h2><center>글 수정</center></h2>
			<c:if test="${selectCnt == 0}">
				<script type="text/javascript">
					errorAlert(passwdError);
				</script>
			</c:if>
			<c:if test="${selectCnt == 1}">
				<form action="modifyPro.do" method="post" name="modifyform"
				onsubmit="return modifyCheck();">
					<table class="boardTable" align="center">
						<tr><th colspan="2">수정할 정보를 입력하세요.</th></tr>
						<tr><th>작성자</th>
							<td>${dto.writer}</td></tr>
						<tr><th>글제목</th>
							<td><input class="input" type="text" name="subject"
							value="${dto.subject}" maxlength="50" style="width:270px;"></td>
						<tr><th>글내용</th>
							<td><textArea class="input" rows="10" cols="40" name="content"
							maxlength="500">${dto.content}</textArea></td></tr>
						<tr><th>비밀번호</th>
							<td><input class="input" type="password" name="passwd"
							value="${dto.passwd}" maxlength="10"></td></tr>
						<tr><th colspan="2">
							<input type="submit" value="수정">
							<input type="reset" value="수정취소">
							<input type="button" value="목록보기"
							onclick="window.location='viewBoard.do?pageNum=${pageNum}'">
						</th></tr>
					</table>
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="pageNum" value="${pageNum}">
				</form>
			</c:if>			
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>

</body>
</html>