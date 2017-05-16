<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/notice.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/issue.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/search.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("td").eq(0).css("width","120px");
		
		/* id="join"인 <form> 태크안의 submit 버튼 클릭한 경우 */
		$('#join').submit(function() {	

			/* 핸드폰 : 첫숫자는 010, 070, 011, 080중 하나로 시작하고, 다음숫자는 3~4개까지 오고 */
			var reg02 = /^(010|070|011|080)\d{3,4}\d{4}$/;
			var result02 = reg02.test($("input[name='signIn_tel']").val());
			if(!result02) {
				$(".consoleInfo").html("휴대폰번호를 잘못입력하셨습니다");
				$("input[name='signIn_tel']").val("");
				$("input[name='signIn_tel']").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="signIn">
			<form action="viewSignIn_agree.jsp" name="myForm" id="join">
				<span id="signIn_title">회원가입</span>
				<hr>
				<table id="table_uInfo">
					<tr>
						<td><label for="signIn_uId">아이디</label></td>
						<td><input type="text" name="signIn_uId" id="signIn_uId" autofocus required></td>
					</tr>
					<tr>
						<td><label for="signIn_uPw">비밀번호</label></td>
						<td><input type="password" name="signIn_uPw" id="signIn_uPw" required></td>
					</tr>
					<tr>
						<td><label for="signIn_sId">주민번호</label></td>
						<td><input type="password" name="signIn_sId" id="signIn_sId" required></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="signIn_gender" id="signIn_gen_m" value="남자">
							<label for="signIn_gen_m">남자&nbsp;&nbsp;</label>
							<input type="radio" name="signIn_gender" id="signIn_gen_w" value="여자">
							<label for="signIn_gen_w">여자</label>
						</td>
					</tr>
					<tr>
						<td><label for="signIn_eMail">이메일</label></td>
						<td><input type="email" name="signIn_eMail" id="signIn_eMail" required></td>
					</tr>
					<tr>
						<td><label for="signIn_url">URL</label></td>
						<td><input type="url" name="signIn_url" id="signIn_url"></td>
					</tr>
					<tr>
						<td><label for="signIn_tel">전화번호</label></td>
						<td><input type="tel" name="signIn_tel" id="signIn_tel" required></td>
					</tr>
					<tr>
						<td>취미</td>
						<td>
							<input type="checkbox" name="signIn_hobby" id="signIn_hobby1" value="축구">
							<label for="signIn_hobby1">축구&nbsp;&nbsp;</label>
							<input type="checkbox" name="signIn_hobby" id="signIn_hobby2" value="야구">
							<label for="signIn_hobby2">야구&nbsp;&nbsp;</label>
							<input type="checkbox" name="signIn_hobby" id="signIn_hobby3" value="수영">
							<label for="signIn_hobby3">수영</label>
						</td>
					</tr>
					<tr>
						<td><label for="signIn_job">직업</label></td>
						<td>
							<select name="signIn_job" id="signIn_job">
								<option>직업을 선택하세요.</option>
								<option value="프로그래머">프로그래머</option>
								<option value="건물주">건물주</option>
								<option value="금수저">금수저</option>
								<option value="아이돌">아이돌</option>
								<option value="작사가">작사가</option>
								<option value="랩퍼">랩퍼</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" class="submit">
							<input type="reset" value="다시작성" class="reset">
						</td>
					</tr>
				</table>
			</form>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
</body>
</html>