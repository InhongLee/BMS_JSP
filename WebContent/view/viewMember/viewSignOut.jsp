<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<html>
<body onload="initFocus('form_signOut');">
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="view_signOut">
			<form action="viewSignOut_check.do" method="post" id="form_signOut" name="form_signOut"
			onsubmit="return viewLogIn_check();">
				<div id="catch_PR">
					회원탈퇴 실시에 대한 주의사항
				</div>
				<div id="customer_id">
					<input class="idChk" name="customer_id" type="text" placeholder="&nbsp;아이디">
				</div>
				<div id="customer_pw">
					<input class="pwChk" name="customer_pw" type="password" placeholder="&nbsp비밀번호">
				</div>	
				<div id="btn_signOut">
					<input class="inputButton fontSizeL" type="submit" value="탈퇴">
				</div>		
			</form>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
</body>
</html>