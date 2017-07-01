<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/setting.jsp" %>
<html>
<body>
	<div id="notice" class="news" style="margin-top:0px; padding-top:0;">
		<c:if test="${announces != null}">
			<div class="open-event fl" style="width:100%;">
				<ul class="notice-list">
				<c:forEach var="announce" items="${announces}">
					<li>
						<a href="contentForm.do?num=${announce.num}&pageNum=1&number=1">
							${announce.subject}
						</a>
					</li>
				</c:forEach>
				<!-- 	<li><a href="./view/viewLogIn.html">[이벤트] 당신도 이제 JAVA마스터! Java Handbook으로 시작하세요.</a></li>
					<li><a href="./view/viewLogIn.html">[이벤트] 친구에게 BMS를 소개하세요. 추첨을 통해 상품권을 드립니다.</a></li>
					<li><a href="./view/viewLogIn.html">[공지] 정기점검 알림: 2017년 4월 30일 정기점검이 있을 예정입니다.</a></li>
					<li><a href="./view/viewLogIn.html">[이벤트] HTML5/CSS3 교재 반값할인중! 지금바로 구매하세요.</a></li> -->
				</ul>
			</div>		
		</c:if>
		
		<script type="text/javascript">
			fn_notice("notice");
		</script>	
			
	</div>
</body>
</html>