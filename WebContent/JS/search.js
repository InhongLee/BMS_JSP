/**
 * 
 */
 $(document).ready(function() {
	
	 // index.html 창 로드시
	 $(window).load(function() {
		
		 /*
		 * 검색창 자동완성 기능(searchBar_autoComplete)
		 * 같은 책에대한 bookTitle과 bookInfo의 index는 동일해야 한다
		 * DB연동후에는 bookTitle과 bookInfo에 순환문을 사용하여 정보 입력하도록 수정 필요
		 * bookInfo의 가격정보는 DB에서 정보 받아올때 LPAD사용해서 자리수 맞추어야 한다  
		 * */ 
		 
		// 자동완성에 사용된 <datalist> 초기화
		$("#goodsList").remove();
		$("#search").append("<datalist id='goodsList'></datalist>");
		// 책 제목 배열
		var bookTitle = new Array();
		bookTitle[0] = "Headfirst Java";
		bookTitle[1] = "JavaScript & jQuery: The Missing Manual";
		bookTitle[2] = "정보처리기사 필기";
		bookTitle[3] = "어서와 Java는 처음이지!";
		bookTitle[4] = "JAVA 객체지향 디자인 패턴";
		bookTitle[5] = "Oracle 11g 프로그래밍";
		// 책 저자|책 가격 목록
		var bookInfo = new Array();
		bookInfo[0] = "케이시 시에라 외 지음 | 28,000원";
		bookInfo[1] = "데이비드 소이어 맥파랜드 지음 | 35,000원";
		bookInfo[2] = "홍봉선 외 지음 | 31,000원";
		bookInfo[3] = "천인국 지음 | 33,000원";
		bookInfo[4] = "정인상 외 지음 | 28,000원";
		bookInfo[5] = "성윤정 지음 | 23,000원";
		// 배열 순회하면서 <datalist id="goodsList">에 <option>을 삽입
		for(var i=0; i<bookTitle.length; i++) {
			$("#goodsList").append("<option value='"+bookTitle[i]+"'>"+bookInfo[i]+"</option>");
		}
		return false;
	 });
	 
	 // 검색창에 검색어 입력 후 엔터 누르면
	 $('input[type=search]').on('search', function () {
		// 검색어를 변수에 대입
		var searchstring = $("input[type=search]");
		searchstring.focus();
		alert("요청하신 ["+searchstring.val()+"] 을 검색중입니다...");
		// 검색창 초기화 후 검색된 책 페이지로 이동
		$("input[type=search]").val("");
		$("#result").html("&nbsp;");
		var url = "./view/viewSales/viewBuyNow.html";
		$("#section01").load(url);
		return false;
	});
	
 });