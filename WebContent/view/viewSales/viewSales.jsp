<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<link href="../../style/styles.css" rel="stylesheet" type="text/css">
	<style>
		.issue {margin:0 auto; margin-top:10px; padding:0px; width:95%;}
		.issue .open-event {height:350px; position:relative; border:1px solid gray; overflow:hidden;}
		.issue .open-event ul{position:absolute; top:10px;}
		.issue .open-event ul li {width:200px; height:350px; display:inline-block; vertical-align:top; margin-right:10px;}
		.issue .open-event .prev{position:absolute; bottom:200px; left:0px; width:30px; height:30px; line-height:0; font-size:0;}
		.issue .open-event .next{position:absolute; bottom:200px; right:0px; width:30px; height:30px; line-height:0; font-size:0;}
		.img_book{width:200px; height:240px;}
		.bookTitle{width:200px; height:20px; overflow:hidden; font-size:small; font-weight:bold; text-align:center;}
		.bookComment{width:200px; height:20px; overflow:hidden; font-size:small; text-align:center; color:#2471A3;}
		.bookPrice{width:200px; height:20px; overflow:hidden; font-size:small; text-align:center;}
		.bookAuthor{width:200px; height:20px; overflow:hidden; font-size:small; text-align:center; color:gray;}
	</style>
	
	<script type="text/javascript" src="../../JS/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="../../JS/scripts.js"></script>
	<script type="text/javascript" src="../../JS/notice.js"></script>
	<script type="text/javascript" src="../../JS/issue.js"></script>
	<script type="text/javascript" src="../../JS/search.js"></script>
	
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
		<div id="issue" class="issue">
		<strong>화제의 책</strong>
		<hr>
		<div class="open-event" style="width:100%;">
			<ul class="book-list">
				<li >
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/HeadFirst_Java.jpg" alt="책이미지  200x240"></a>
					<div class="bookTitle">Headfirst Java</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/자바스크립트.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">JavaScript N jQuery: The Missing Manual</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/정보처리기사필기.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">정보처리기사 필기</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/HTML5+CSS3.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">HTML5+CSS3 웹 표준의 정석</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/해킹방어를위한JAVA시큐어코딩.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">해킹방어를 위한 JAVA 시큐어코딩</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/정보처리기사필기.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">정보처리기사 필기</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/HTML5+CSS3.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">HTML5+CSS3 웹 표준의 정석</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
			</ul>
			<span id="btn_issue">
				<a href="#" class="prev"><img src="../../images/icon_arrow_left.png" alt="Prev"></a>
				<a href="#" class="next"><img src="../../images/icon_arrow_right.png" alt="Next"></a>
			</span>
		</div>
		<script type="text/javascript">fn_issue('btn_issue','issue')</script>
		</div>
		
		<div id="bestseller" class=issue>
		<strong>이달의 베스트셀러</strong>
		<hr>
		<div class="open-event" style="width:100%;">
			<ul class="book-list">
				<li >
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/HeadFirst_Java.jpg" alt="책이미지  200x240"></a>
					<div class="bookTitle">Headfirst Java</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/자바스크립트.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">JavaScript N jQuery: The Missing Manual</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/정보처리기사필기.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">정보처리기사 필기</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/HTML5+CSS3.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">HTML5+CSS3 웹 표준의 정석</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/해킹방어를위한JAVA시큐어코딩.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">해킹방어를 위한 JAVA 시큐어코딩</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/정보처리기사필기.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">정보처리기사 필기</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
				<li>
					<a href="../viewSales/viewBuyNow.jsp"><img class="img_book" src="../../images/자바스크립트.jpg" alt="책이미지 200x240"></a>
					<div class="bookTitle">JavaScript N jQuery: The Missing Manual</div>
					<div class="bookComment">간략한 묘사</div>
					<div class="bookPrice">35,000원</div>
					<div class="bookAuthor">D.S. 맥파랜드 지음 | 지앤선 출판</div>
				</li>
			</ul>
			<span id="btn_bestseller">
				<a href="#" class="prev"><img src="../../images/icon_arrow_left.png" alt="Prev"></a>
				<a href="#" class="next"><img src="../../images/icon_arrow_right.png" alt="Next"></a>
			</span>
		</div>
		<script type="text/javascript">fn_issue('btn_bestseller','bestseller')</script>
		</div>
	</div>
	
	<div class="main_footer">
		<jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/>
	</div>
	
</body>
</html>