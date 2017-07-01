<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>

<html>
<body onload="initFocus('form_signIn')">

	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="signIn">
			<form action="viewSignIn_agree.do" method="post" id="form_signIn" name="form_signIn" onsubmit="return viewSignIn_check();">
				<span id="signIn_title">회원가입</span>
				<hr>
				<table id="table_uInfo">
					<tr>
						<td style="width:15%; min-width:100px;"><label for="signIn_uId">아이디 *</label></td>
						<td style="width:35%; min-width:200px;">
							<input class="idChk" type="text" name="customer_id" id="signIn_uId" maxlength="20" onchange="resetHiddenId();">
							<input class="inputButton" type="button" name="dupChk" value="중복확인" onclick="confirmId();" style="width:100px;">
						</td>
						<td style="width:50%;"></td>
					</tr>
					<tr>
						<td><label for="signIn_uPw">비밀번호 *</label></td>
						<td><input class="input pwChk" type="password" name="customer_pw" id="signIn_uPw" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_reuPw">비밀번호 확인 *</label></td>
						<td><input class="input repwChk" type="password" name="customer_repw" id="signIn_reuPw" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_name">이름 *</label></td>
						<td><input class="input nameChk" type="text" name="customer_name" id="signIn_name" maxlength="20"></td>
					</tr>
					<tr>
						<td><label for="signIn_sId">주민번호 *</label></td>
						<td>
							<input class="sIdChk1" type="text" name="customer_sid1" id="customer_sid1"
							maxlength="6" style="width:60px;" onkeyup="autoTab('form_signIn', 'customer_sid1', 6, 'customer_sid2');">
							-
							<input class="sIdChk2" type="text" name="customer_sid2" id="customer_sid2"
							maxlength="7" style="width:70px;" onkeyup="autoTab('form_signIn', 'customer_sid2', 7, 'customer_hp1');">
						</td>
					</tr>
					<tr>
						<td><label for="signIn_hp">연락처</label></td>
						<td>
							<input class="hpChk1" type="text" name="customer_hp1" id="customer_hp1"
							maxlength="3" style="width:30px;" onkeyup="autoTab('form_signIn', 'customer_hp1', 3, 'customer_hp2');">
							-
							<input class="hpChk2" type="text" name="customer_hp2" id="customer_hp2"
							 maxlength="4" style="width:40px;" onkeyup="autoTab('form_signIn', 'customer_hp2', 4, 'customer_hp3');">
							-
							<input class="hpChk3" type="text" name="customer_hp3" id="customer_hp3"
							 maxlength="4" style="width:40px;" onkeyup="autoTab('form_signIn', 'customer_hp3', 4, 'signIn_eMail');">
						</td>
					</tr>
					<tr>
						<td><label for="signIn_eMail">이메일 *</label></td>
						<td>
							<input class="emailChk1" type="text" name="customer_email1" id="signIn_eMail"
							maxlength="10" style="width:100px;">
							@
							<input class="emailChk2" type="text" name="customer_email2"
							maxlength="19" style="width:100px;">
							<select class="emailChk3" name="customer_email3" onchange="emailChk('form_signIn');">
								<option value="0" selected>직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">
							<div style="width:30%; height:30px; display:inline-block;"><input class="inputButton" type="submit" value="회원가입" ></div>
							<div style="width:30%; height:30px; display:inline-block;"><input class="inputButton" type="reset" value="다시작성" ></div>
							<div style="width:30%; height:30px; display:inline-block;"><input class="inputButton" type="button" value="가입취소" onclick="window.location='viewLogIn.do'"></div>
						</td>
					</tr>
				</table>
				<input type="hidden" name="hiddenId" value="0">
			</form>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
</body>
</html>