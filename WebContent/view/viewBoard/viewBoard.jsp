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
			<h2 style="text-align: center;">자유 게시판</h2>
				<table class="boardTable" style="width:1000px; text-align: center;">
					<tr>
						<th colspan="6" align="right" style="height:25px;">
							글목록(글갯수 : ${cnt}) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="writeForm.do">글쓰기</a>
						</th>
					</tr>
					<tr>
						<th style="width:5%;">글번호</th>
						<th style="width:35%;">글제목</th>
						<th style="width:10%;">작성자</th>
						<th style="width:15%;">작성일</th>
						<th style="width:5%;">조회수</th>
						<th style="width:10%;">IP</th>
					</tr>
					<!-- 게시글이 있으면 -->
					<c:if test="${cnt > 0}">
						<c:forEach var="announce" items="${announce}">
							<c:if test="${announce.announce == 'Y'}">
								<tr style="background-color: lightgray; font-weight: bold;">
									<td align="center">공지사항</td>
									<td>
										&nbsp;
										<a href="contentForm.do?num=${announce.num}&pageNum=${pageNum}&number=${number+1}">
										${announce.subject}</a>
									</td>
									<td align="center">${announce.writer}</td>
									<td align="center">
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm"
										value="${announce.reg_date}"/>
									</td>
									<td align="center">${announce.readCnt}</td>
									<td align="center">${announce.ip}</td>
								</tr>	
							</c:if>
						</c:forEach>
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td align="center">
									${number}
									<c:set var="number" value="${number - 1}"/>
								</td>
								<td>
									&nbsp;
									<c:if test="${dto.ref_level > 1}">
										<c:set var="wid" value="${(dto.ref_level - 1) * 10}"/>
										<img src="${project}images/level.gif" border="0" width="${wid}" height="15">
									</c:if>
									<c:if test="${dto.ref_level > 0}">
										<img src="${project}images/re.gif" border="0" width="20" height="15">
									</c:if>
									<a href="contentForm.do?num=${dto.num}&pageNum=${pageNum}&number=${number+1}">
									${dto.subject}</a>
									<c:if test="${dto.readCnt > 10}">
										<img src="${project}images/hot.gif" border="0" width="20" height="15">
									</c:if>
								</td>
								<td align="center">${dto.writer}</td>
								<td align="center">
									<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm"
									value="${dto.reg_date}"/>
								</td>
								<td align="center">${dto.readCnt}</td>
								<td align="center">${dto.ip}</td>
							</tr>			
						</c:forEach>
					</c:if>
					<!-- 게시글이 없으면 -->
					<c:if test="${cnt == 0}">
						<tr>
							<td colspan="6" align="center">
								게시판에 글이 없습니다. 글을 작성해 주세요.
							</td>
						</tr>
					</c:if>
				</table>
				
				<!-- 페이지 컨트롤러 -->
				<table class="boardTable" style="width:1000px; text-align:center;">
					<th style="text-align:center;">
						<c:if test="${cnt > 0}">
							<!-- 처음(◀◀)/ 이전블록(◀)을 만들어 준다 -->
							<c:if test="${startPage > pageBlock}">
								<a href="viewBoard.do">[◀◀]</a> <!-- 첫 페이지로 이동 -->
								<a href="viewBoard.do?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span>[${i}]</span>
								</c:if>
								<c:if test="${i != currentPage}">
									<a href="viewBoard.do?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<!-- 마지막(▶▶)/ 다음블록(▶)을 만들어 준다 -->
							<c:if test="${pageCount > endPage}">
								<a href="viewBoard.do?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
								<a href="viewBoard.do?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
							</c:if>
						</c:if>
					</th>
				</table>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>
	
</body>
</html>