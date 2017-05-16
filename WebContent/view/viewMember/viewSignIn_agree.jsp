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

</head>
<body>

	<%
	/* 입력받은 값을 받아온다. (한글 인코딩 처리) */
	request.setCharacterEncoding("UTF-8");
	String signIn_uId	= request.getParameter("signIn_uId");
	String signIn_uPw	= request.getParameter("signIn_uPw");
	String signIn_sId	= request.getParameter("signIn_sId");
	String signIn_gender	= request.getParameter("signIn_gender");
	String signIn_eMail	= request.getParameter("signIn_eMail");
	String signIn_url	= request.getParameter("signIn_url");
	String signIn_tel	= request.getParameter("signIn_tel");
	String signIn_job	= request.getParameter("signIn_job");
	
	session.setAttribute("signIn_uId", signIn_uId);
	session.setAttribute("signIn_uPw", signIn_uPw);
	session.setAttribute("signIn_sId", signIn_sId);
	session.setAttribute("signIn_gender", signIn_gender);
	session.setAttribute("signIn_eMail", signIn_eMail);
	session.setAttribute("signIn_url", signIn_url);
	session.setAttribute("signIn_tel", signIn_tel);
	session.setAttribute("signIn_job", signIn_job);
	%>

	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<form action="viewSignIn_subscribe.jsp" method="post">
				<fieldset>
					<legend>회원약관</legend>
					<hr>
					<p>1. 회원정보는 웹사이트의 운영정보를 위해서만 사용됩니다.</p>
					<p>2. 웹사이트의 정상운영을 방해하는 회원은 탈퇴처리합니다.</p>
					<hr>
					<P>위의 약관에 동의하십니까?
					<input type="radio" name="agree" value="YES">동의함&nbsp;
					<input type="radio" name="agree" value="NO" checked>동의안함&nbsp;</P>
					<input type="submit" value="확인">
				</fieldset>
			</form>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>

</body>
</html>