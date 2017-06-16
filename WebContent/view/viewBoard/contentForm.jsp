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
			<h2 style="text-align: center;">상세 페이지</h2>
			<table class="boardTable" style="text-align: center;">
				<tr>
					<th style="width:150px;">글번호</th>
					<td style="width:150px;" align="center">${number}</td> <!-- db 글번호num이 아닌 number -->
					<th style="width:150px;">조회수</th>
					<td style="width:150px;" align="center">${dto.readCnt}</td>
				</tr>
				<tr>
					<th style="width:150px;">작성자</th>
					<td style="width:150px;" align="center">${dto.writer}</td>
					<th style="width:150px;">작성일</th>
					<td style="width:150px;" align="center">
					<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}"/></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td colspan="3" align="center">${dto.subject}</td>
				</tr>
				<tr height="250px;">
					<th>글내용</th>
					<td colspan="3">${dto.content}</td>
				</tr>
				<tr>
					<th colspan="4" align="center">
						<input type="button" value="글수정"
						onclick="window.location='modifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
						<input type="button" value="글삭제"
						onclick="window.location='deleteForm.do?num=${dto.num}&pageNum=${pageNum}'">
						<c:if test="${dto.announce == 'N'}">
							<input type="button" value="답글쓰기"
							onclick="window.location='writeForm.do?num=${dto.num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}'">
						</c:if>
						<input type="button" value="목록보기"
						onclick="window.location='viewBoard.do?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
	
</body>
</html>