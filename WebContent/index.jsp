<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 방법1 : content="1; url=a.html" 1초후에 지정한 url로 이동 -->
<!-- <meta http-equiv="refresh" content="1; url=index.html"> -->
<title>Insert title here</title>
	<script type="text/javascript">
		/* 방법2 : */
		setTimeout(function() {
			window.location='index.html';
		}, 1000);
	</script>
</head>
<body>

<h1>Book Management System에 접속중입니다...</h1>
</body>
</html>