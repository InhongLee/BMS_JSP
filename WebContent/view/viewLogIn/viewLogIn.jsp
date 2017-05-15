<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/notice.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/issue.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/search.js"></script>
<script type="text/javascript">
	$(document).ready(function() {		
		/* 회원가입 버튼 클릭 시 회원가입 페이지로 연결 */
		
		$("#btn_signIn").bind({
			"mouseenter":function() {
				$("#btn_signIn a").css("color","yellow");
				$("#btn_signIn a").css("text-shadow","0px 2px 2px black");
				$("#consoleInfo").html("회원가입 페이지로 이동합니다");},
			"mouseleave":function() {
				$("#btn_signIn a").css("color","white");
				$("#btn_signIn a").css("text-shadow","none");
				$("#consoleInfo").html("&nbsp;");}
		});
		$("#btn_logIn").bind({
			"click":	function() {
				if(!$("input[name='user_id']").val()) {
					$(".consoleInfo").html("아이디를 입력하세요.");
					$("input[name='user_id']").focus();
					return false;
				} else if(!$("input[name='user_pw']").val()) {
					$(".consoleInfo").html("비밀번호를 입력하세요");
					$("input[name='user_pw']").focus();
					return false;
				} else {
					/*
					*	!!!추가작업 필요!!!
					*	입력받은 id, pw를 회원 db와 비교 하여 일치하지 않으면 불일치 내용을 띄우고 재입력 요청
					*
					*/
					var uId = $("input[name='user_id']").val();
					var uPw = $("input[name='user_pw']").val();
					if(uId != "guest" || uPw != "guest") {
						$(".consoleInfo").html("입력정보와 일치하는 회원이 없습니다.");
						$("input[name='user_id']").val("");
						$("input[name='user_pw']").val("");
						$("input[name='user_id']").focus();
						return false;
					} else {
						$(".consoleInfo").html("&nbsp;");					
					}
				}	
			},
			"mouseleave":function() {
				$("#btn_logIn a").css("color","white");
				$("#btn_logIn a").css("text-shadow","none");
				$(".consoleInfo").html("&nbsp;");},
			"mouseenter":function() {
				$("#btn_logIn a").css("color","yellow");
				$("#btn_logIn a").css("text-shadow","0px 2px 2px black");
				$(".consoleInfo").html("로그인을 시도합니다");}
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
		<div id="view_logIn">
			<form name="form_logIn" action="" method="post">
				<div id="catch_PR">
					사이트의 목적을 보여주는 간단한 표어 배치
				</div>
				<div id="user_id">
					<input name="user_id" type="text" placeholder="&nbsp;아이디" required autofocus>
				</div>
				<div id="user_pw">
					<input name="user_pw" type="password" placeholder="&nbsp비밀번호">
				</div>
				<div id="btn_logIn">
					<a href="../viewSales/viewSales.jsp">로그인</a>
				</div>	
				<div id="btn_signIn">
					<a href="../viewMember/viewSignIn.jsp">회원가입</a>
				</div>		
			</form>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
</body>
</html>