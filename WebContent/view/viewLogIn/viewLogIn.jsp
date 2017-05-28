<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<html>
<body onload="initFocus('form_logIn')">
	
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp"		flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp"	flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp"		flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<div id="view_logIn">
				<form action="viewLogIn_check.do" method="post" id="form_logIn" name="form_logIn" onsubmit="return viewLogIn_check();">
					<div id="catch_PR">		사이트의 목적을 보여주는 간단한 표어 배치																					</div>
					<div id="customer_id">	<input class="idChk" name="customer_id" type="text" maxlength="20" placeholder="&nbsp;아이디">		</div>
					<div id="customer_pw">	<input class="pwChk" name="customer_pw" type="password" maxlength="10" placeholder="&nbsp비밀번호">			</div>
					<div id="btn_logIn">	<input class="inputButton fontSizeL" type="submit" value="로그인">											</div>	
					<div id="btn_signIn">	<input class="inputButton fontSizeL" type="button" value="회원가입" onclick="window.location='viewSignIn.do'">	</div>		
				</form>		
			</div>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>

</body>
</html>