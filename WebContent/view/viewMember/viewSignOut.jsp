<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../style/styles.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../../JS/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="../../JS/scripts.js"></script>
	<script type="text/javascript" src="../../JS/notice.js"></script>
	<script type="text/javascript" src="../../JS/issue.js"></script>
	<script type="text/javascript" src="../../JS/search.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/* 회원가입 버튼 클릭 시 회원가입 페이지로 연결 */		
			$("#btn_signOut").bind({
				"click":	function() {
					if(!$("input[name='user_id']").val()) {
						$(".consoleInfo").html("아이디를 입력하세요.");
						$("input[name='user_id']").focus();
						return false;
					} else if(!$("input[name='user_pw']").val()) {
						$("#consoleInfo").html("비밀번호를 입력하세요");
						$("input[name='user_pw']").focus();
						return false;
					} else {
						/*
						*	!!!추가작업 필요!!!
						*	입력받은 id, pw를 회원 db와 비교 하여 일치하지 않으면 불일치 내용을 띄우고 재입력 요청
						*
						*/
						if(false) {
							$(".consoleInfo").html("입력정보와 일치하는 회원이 없습니다.");
							$("input[name='user_id']").val("");
							$("input[name='user_pw']").val("");
							$("input[name='user_id']").focus();
							return false;
						}
						$(".consoleInfo").html("&nbsp");
						
					}	
				},
				"mouseleave":function() {
					$("#btn_signOut a").css("color","white");
					$("#btn_signOut a").css("text-shadow","none");
					$("#consoleInfo").html("&nbsp");},
				"mouseenter":function() {
					$("#btn_signOut a").css("color","yellow");
					$("#btn_signOut a").css("text-shadow","0px 2px 2px black");
					$(".consoleInfo").html("정말 회원 탈퇴를 하시겠습니까?");}
			});
		});
	</script>
</head>
<body>

	<div class="main_header">
		<div class="title"><h1><a href="../../index.jsp">Book Management System</a></h1></div>
		<jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/>
		<div class="consoleInfo">콘솔정보창</div>
		<jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/>
		<jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/>
	</div>
	
	<div class="main_section">
		<div id="view_signOut">
			<form name="form_signOut" action="" method="post">
				<div id="catch_PR">
					회원탈퇴 실시에 대한 주의사항
				</div>
				<div id="user_id">
					<input name="user_id" type="text" placeholder="&nbsp;아이디" required autofocus>
				</div>
				<div id="user_pw">
					<input name="user_pw" type="password" placeholder="&nbsp비밀번호">
				</div>	
				<div id="btn_signOut">
					<a href="../viewSales/viewSales.jsp">탈퇴</a>
				</div>		
			</form>
		</div>
	</div>
	
	<div class="main_footer">
		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>
	</div>
	
</body>
</html>