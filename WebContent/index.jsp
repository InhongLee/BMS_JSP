<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Insert title here</title>
	<link href="./style/styles.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="./JS/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="./JS/scripts.js"></script>
	<script type="text/javascript" src="./JS/notice.js"></script>
	<script type="text/javascript" src="./JS/issue.js"></script>
	<script type="text/javascript" src="./JS/search.js"></script>
</head>

<body>
	<header id="main_header">
		<div id="title">
			<h1><a href="index.html">Book Management System</a></h1>
		</div>
		<jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/>
		<div id="consoleInfo">
			콘솔정보창
		</div>
		<jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/>
		<div id="search">
			<input type="search" id="searchBar" list="goodsList" placeholder="&nbsp;검색하실 책의 정보를 입력하세요.">
			
		</div>
	</header>
	<section id="main_section">
		<div id="section01"></div>
	</section>
	<footer id="main_footer">
		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>
	</footer>
</body>
</html>