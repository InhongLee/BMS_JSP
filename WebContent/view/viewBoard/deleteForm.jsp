<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body onload="passwdFocus();">

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<h2><center>글 삭제</center></h2>
			<form action="deletePro.do" method="post" name="passwdform" onsubmit="return passwdCheck();">
				<table class="boardTable" align="center" style="width:300px;">
					<tr>
						<th colspan="2">비밀번호를 다시 입력하세요.</th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="input" type="password" name="passwd" maxlength="10"></td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="글삭제">
							<input type="button" value="삭제취소"
							onclick="window.history.back();">
						</th>
					</tr>
				</table>
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="pageNum" value="${pageNum}">
			</form>			
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
	
</body>
</html>