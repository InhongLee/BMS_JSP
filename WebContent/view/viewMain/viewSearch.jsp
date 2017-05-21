<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lee.inhong.BMS_JSP.dto.ViewBook" %>
<%-- <%ArrayList<ViewBook> bookList = (ArrayList<ViewBook>) request.getAttribute("bookList");%> --%>
<html>
<head>
</head>
<body>
	<div id="search">		
		<input type="search" id="searchBar" list="goodsList" placeholder="&nbsp;검색하실 책의 정보를 입력하세요.">
	</div>
<script type="text/javascript">

/**
 * 검색창 자동완성 기능(searchBar_autoComplete)
 */
$(document).ready(function() {
		 /*
		 * 검색창 자동완성 기능(searchBar_autoComplete)
		 * 같은 책에대한 bookTitle과 bookInfo의 index는 동일해야 한다
		 * DB연동후에는 bookTitle과 bookInfo에 순환문을 사용하여 정보 입력하도록 수정 필요
		 * bookInfo의 가격정보는 DB에서 정보 받아올때 LPAD사용해서 자리수 맞추어야 한다 
		 * Ajax study후 Ajax연동하여 구현 예정...
		 * 문제점
		 * 한글입력시 자동완성 기능을 사용하려면 스페이스바로 한칸 띄우고 다시 백스페이스바로 돌아와야 된다
		 * 크롬을 기준으로 UI설계하여 IE에서는 검색결과가 재대로 보이지 않는다
		 * 
		 * 대안
		 * jQuery.UI api사용시 동일한 효과 구현가능?
		 * */ 
	<%-- $(window).load(function() {
		// 자동완성에 사용된 <datalist> 초기화
		$("#goodsList").remove();
		$("#search").append("<datalist id='goodsList'></datalist>");
		<%for(int i=0; i<bookList.size(); i++) {
			String book_title 		= bookList.get(i).getBook_title();
			String book_author 		= bookList.get(i).getBook_author();
			String publisher_name 	= bookList.get(i).getPublisher_name();%>
			$("#goodsList").append("<option value='<%=book_title%>'><%=book_author + '|' + publisher_name%></option>");
		<%}%>
	});	  --%>
	 // 검색창에 검색어 입력 후 엔터 누르면
	<%-- $('input[type=search]').on('search', function () {
		// 검색어를 변수에 대입
		var searchstring = $("input[type=search]");
		searchstring.focus();
		alert(searchstring.val());
		// 검색창 초기화 후 검색된 책 페이지로 이동
		$("input[type=search]").val("");
		$("#result").html("&nbsp;");
		<%for(int i=0; i<bookList.size(); i++) {
			String ISBN				= bookList.get(i).getISBN();
			String book_title 		= bookList.get(i).getBook_title();%>
			if(searchstring.val() == '<%=book_title%>') {
				window.location.href='viewBuyNow.do?ISBN=<%=ISBN%>';
			}
		<%}%>
	}); --%>
});
</script>
</body>
</html>