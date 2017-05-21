<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/JS/scripts.js"></script>

</head>
<body>
	
	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath()%>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
			<div id="view_logIn">
			<%!String customer_id;%>
			<% customer_id = (String)request.getSession().getAttribute("customer_id");
		       if (customer_id == null) {%>
			<form action="viewLogIn_check.do" method="post" name="form_logIn" onsubmit="return viewLogIn_check();">
				<div id="catch_PR">		사이트의 목적을 보여주는 간단한 표어 배치																					</div>
				<div id="customer_id">	<input class="idChk" name="customer_id" type="text" maxlength="20" placeholder="&nbsp;아이디" autofocus>		</div>
				<div id="customer_pw">	<input class="pwChk" name="customer_pw" type="password" maxlength="12" placeholder="&nbsp비밀번호">			</div>
				<div id="btn_logIn">	<input class="inputButton fontSizeL" type="submit" value="로그인">											</div>	
				<div id="btn_signIn">	<input class="inputButton fontSizeL" type="button" value="회원가입" onclick="window.location='viewSignIn.do'">	</div>		
			</form>
			<% } else {response.sendRedirect("viewMemberInfo.do");}%>				
			</div>
		</td></tr>
		<tr class="mainRow6"><td>		<div class="consoleInfo">콘솔정보창</div>																		</td></tr>
		<tr class="mainRow7"><td>		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>											</td></tr>
	</table>

</body>
</html>