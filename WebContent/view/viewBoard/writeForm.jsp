<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body onload="writeFocus();">

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<h2><center>글쓰기</center></h2>
			<form action="writePro.do" method="post" name="writeform"
			onsubmit="return writeCheck();">
				<table class="boardTable" align="center">
					<tr>
						<th style="width:150px;">작성자</th>
						<td>
							<input class="input" type="text" name="writer" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input" type="password" name="passwd" maxlength="10">
						</td>
					</tr>
					<tr>
						<th>글제목</th>
						<td>
						<input class="input" type="text" name="subject" maxlength="50">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="16" cols="40" name="content" maxlength="500"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="작성">
							<input type="reset" value="취소">
							<input type="button" value="목록보기"
							onclick="window.location='viewBoard.do'">
						</th>
					</tr>
				</table>
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="ref_step" value="${ref_step}">
				<input type="hidden" name="ref_level" value="${ref_level}">
			</form>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>

</body>
</html>