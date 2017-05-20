/**
 * 
 */

var msg_id	= "아이디를 입력하세요.";
var msg_pwd	= "비밀번호를 입력하세요.";
var msg_repwd = "비밀번호 확인을 입력하세요.";
var msg_repwdChk = "비밀번호가 다릅니다.";
var msg_name = "이름을 입력하세요.";
var msg_birth = "주민번호를 입력하세요.";
var msg_email = "이메일을 입력하세요.";
var msg_emailChk = "이메일 형식에 맞지 않습니다.";
var msg_confirmId = "중복확인을 해주세요.";

$(document).ready(function() {
	$(window).load(function()				{$(".sub_menu").hide();
											 return false;												});
	$("#sales").mouseover(function()		{$("#sub_sales").show();									});
	$("#sales").mouseout(function()			{$("#sub_sales").hide();									});
	$("#stock").mouseover(function()		{$("#sub_stock").show();									});
	$("#stock").mouseout(function()			{$("#sub_stock").hide();									});
	$("#order").mouseover(function()		{$("#sub_order").show();									});
	$("#order").mouseout(function()			{$("#sub_order").hide();									});
	$("#member").mouseover(function()		{$("#sub_member").show();									});
	$("#member").mouseout(function()		{$("#sub_member").hide();									});
	$("#account").mouseover(function()		{$("#sub_account").show();									});
	$("#account").mouseout(function()		{$("#sub_account").hide();									});

	$(".inputButton").bind(					{
		"mouseenter":function() 			{$(this).css("color","yellow");
											 $(this).css("text-shadow","0px 2px 2px black");			},
		"mouseleave":function() 			{$(this).css("color","white");
											 $(this).css("text-shadow","none");							}});
});

function viewLogIn_check() { //로그인 정보(id,pw)입력 후 로그인 버튼 클릭 > 입력정보 검증
	if(!document.form_logIn.customer_id.value)			{$(".consoleInfo").html(msg_id);	document.form_logIn.customer_id.focus();	return false;}
	else if(!document.form_logIn.customer_pw.value)		{$(".consoleInfo").html(msg_pwd);	document.form_logIn.customer_pw.focus();	return false;}
	else 												{$(".consoleInfo").html("&nbsp;");}
}

function viewSignIn_check() { //회원가입 정보(id,pw,이름,주민번호,연락처,이메일)입력 후 회원가입 버튼 클릭 > 입력정보 검증
	if(!document.form_signIn.customer_id.value)			{$(".consoleInfo").html(msg_id);	document.form_signIn.customer_id.focus();	return false;}
	else if(!document.form_signIn.customer_pw.value)	{$(".consoleInfo").html(msg_pwd);	document.form_signIn.customer_pw.focus();	return false;}
	else if(!document.form_signIn.customer_repw.value)	{$(".consoleInfo").html(msg_repwd);	document.form_signIn.customer_repw.focus();	return false;}
	else if(document.form_signIn.customer_pw.value != document.form_signIn.customer_repw.value) //비밀번호 != 비밀번호 확인
														{$(".consoleInfo").html(msg_repwdChk);
														document.form_signIn.customer_pw.value = "";
														document.form_signIn.customer_repw.value = "";
														document.form_signIn.customer_pw.focus();
														return false;}
	else if(!document.form_signIn.customer_name.value)	{$(".consoleInfo").html(msg_name);	document.form_signIn.customer_name.focus(); return false;}
	else if(!document.form_signIn.customer_sid1.value)	{$(".consoleInfo").html(msg_birth);	document.form_signIn.customer_sid1.focus();	return false;}
	else if(!document.form_signIn.customer_sid2.value)	{$(".consoleInfo").html(msg_birth);	document.form_signIn.customer_sid2.focus();	return false;}
	else if(!document.form_signIn.customer_email1.value){$(".consoleInfo").html(msg_email);	document.form_signIn.customer_email1.focus();return false;}
	else if(!document.form_signIn.customer_email2.value){$(".consoleInfo").html(msg_email);	document.form_signIn.customer_email2.focus();return false;}
	else if(document.form_signIn.hiddenId.value == 0)	{$(".consoleInfo").html(msg_confirmId);document.form_signIn.hiddenId.focus();	return false;}
}

function emailChk() {
	if(document.form_signIn.customer_email3.value != 0) 	{document.form_signIn.customer_email2.value = document.form_signIn.customer_email3.value;
															 document.form_signIn.customer_email2.setAttribute("disabled",true);
															 return false;}
	else if(document.form_signIn.customer_email3.value == 0){document.form_signIn.customer_email2.value = "";
															 document.form_signIn.customer_email2.removeAttribute("disabled");
															 return false;}
}

function confirmId() { //회원가입 페이지에서 입력한 id가 이미 있는 아이디인지 확인
	if(!document.form_signIn.customer_id.value)			{$(".consoleInfo").html(msg_id);	document.form_signIn.customer_id.focus();	return false;}
	var url = "confirmId.do?customer_id=" + document.form_signIn.customer_id.value;
	window.open(url, "confirm", "menubar=no, width=300, height=200");
}
function confirmIdCheck() {
	if(!document.form_confirm.customer_id.value)		{document.form_confirm.customer_id.focus(); return false;}
}
function setId(customer_id) { //회원가입 페이지에서 입력한 id 중복확인을 완료
	opener.document.form_signIn.customer_id.value = customer_id;
	opener.document.form_signIn.hiddenId.value = 1;
	self.close();
}
function resetHiddenId() {
	document.form_signIn.hiddenId.value = 0;
}
// 입력값이 정해진 숫자를 채우면 자동으로 다음 입력란으로 이동
function next_sId1()	{if(document.form_signIn.customer_sid1.value.length >= 6)	{document.form_signIn.customer_sid2.focus();}}
function next_sId2()	{if(document.form_signIn.customer_sid2.value.length >= 7)	{document.form_signIn.customer_hp1.focus();}}
function next_hp1()		{if(document.form_signIn.customer_hp1.value.length >= 3)	{document.form_signIn.customer_hp2.focus();}}
function next_hp2()		{if(document.form_signIn.customer_hp2.value.length >= 4)	{document.form_signIn.customer_hp3.focus();}}
function next_hp3()		{if(document.form_signIn.customer_hp3.value.length >= 4)	{document.form_signIn.customer_email1.focus();}}
/**
 * 공지사항 롤링바 구현 javascript
 */
function fn_notice(containerID){
	/* .find()
	 * ---------------------------------------------------
	 * Get the descendants of each element 
	 * in the current set of matched elements, 
	 * filtered by a selector, jQuery object, or element.
	 */
	var $element = $('#'+containerID).find('.notice-list');
	var speed = 5000;
	var timer = null;
	/* .outerHeight()
	 * ----------------------------------------------------
	 * Get the current computed outer height 
	 * (including padding, border, and optionally margin) 
	 * for the first element in the set of matched elements 
	 * or set the outer height of every matched element.
	 */
	var move = $element.children().outerHeight();
	var first = false;
	var lastChild;

	lastChild = $element.children().eq(-1).clone(true);
	/* 삽입할 요소.prependTo(삽입될 컨테이너)
	 * ----------------------------------------------------
	 * Insert every element in the set of matched elements 
	 * to the beginning of the target.
	 * ====================================================
	 * 삽입할 요소.appendTo(삽입될 컨테이너)
	 * ----------------------------------------------------
	 * Insert every element in the set of matched elements 
	 * to the end of the target.
	 */
	lastChild.prependTo($element);
	$element.children().eq(-1).remove();

	/* 만약 공지사항이 하나뿐이면 위치를 고정시키고 아니라면 요소의 크기만큼 위로 스크롤*/
	if($element.children().length==1){$element.css('top','0px');}
	else{$element.css('top','-'+move+'px');}
	
	/* setInterval(function_name, milliseconds)
	 * ---------------------------------------------------
	 * 일정시간이 지날 때마다 지정된 함수를 실행시키는 명령어
	 */
	timer = setInterval(moveNextSlide, speed);
	
	/* jQuery 안에 이벤트 분기에 따른 익명함수 선택법
	 * ----------------------------------------------------
	 * 기본형
	 * $('poo').bind("click",function() {});
	 * 분기형
	 * $('poo').bind(
	 * 		{"mouseover":function() {}},
	 * 		{"mouseout"	:function() {}}
	 * 				);
	 * */
	$element.find('>li').bind({
		'mouseenter': function(){clearInterval(timer);},
		'mouseleave': function(){timer = setInterval(moveNextSlide, speed);}
	});

	function moveNextSlide(){
		$element.each(function(idx){
			/* 목록의 첫번째 공지를 복사하여 목록의 끝에 추가 후 첫번째 공지를 목록에서 제거
			 * 
			 * */
			var firstChild = $element.children().filter(':first-child').clone(true);
			
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('top','0px');

			$element.eq(idx).animate({'top':'-'+move+'px'},'normal');

		});
	}
}

/**
 * 메인페이지 좌우 자동 이동 구현
 */
function fn_issue(buttonID,containerID){
	var $element = $('#'+containerID).find('.book-list');
	var $prev = $('#'+buttonID).find('.prev');
	var $next = $('#'+buttonID).find('.next');
	
	var speed = 5000;
	var timer = null;
	var move = $element.children().outerWidth();
	var first = false;
	var lastChild;

	lastChild = $element.children().eq(-1).clone(true);
	lastChild.prependTo($element);
	$element.children().eq(-1).remove();

	if($element.children().length==1){$element.css('left','0px');}
	else{$element.css('left','-'+move+'px');}

	timer = setInterval(moveNextSlide, speed);
	
	$element.find('>li').bind({
		'mouseenter': function() {clearInterval(timer);},
		'mouseleave': function() {timer = setInterval(moveNextSlide, speed);}
	});
	
	function moveNextSlide(){
		$element.each(function(idx){
			/* 목록의 첫번째 공지를 복사하여 목록의 끝에 추가 후 첫번째 공지를 목록에서 제거
			 * 
			 * */
			var firstChild = $element.children().filter(':first-child').clone(true);
			
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('left','0px');

			$element.eq(idx).animate({'left':'-'+move+'px'},'slow');

		});
	}
	
	$prev.bind('click',function(){
		$element.each(function(idx){
			if(!first){
				$element.eq(idx).animate({'left': '0px'},'normal',function(){
					lastChild = $(this).children().eq(-1).clone(true);
					lastChild.prependTo($element.eq(idx));
					$(this).children().eq(-1).remove();
					$(this).css('left','-'+move+'px');
				});
				first = true;
				return false;
			}

			$element.eq(idx).animate({'left': '0px'},'normal',function(){
				lastChild = $(this).children().filter(':last-child').clone(true);
				lastChild.prependTo($element.eq(idx));
				$(this).children().filter(':last-child').remove();
				$(this).css('left','-'+move+'px');
			});
		});
		return false;
	});

	$next.bind('click',function(){
		$element.each(function(idx){

			var firstChild = $element.children().filter(':first-child').clone(true);
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('left','0px');

			$element.eq(idx).animate({'left':'-'+move+'px'},'normal');

		});
		return false;
	});
}

/**
 * 검색창 자동완성 기능(searchBar_autoComplete)
 */
 $(document).ready(function() {
	
	 // index.html 창 로드시
	 $(window).load(function() {
		
		 /*
		 * 검색창 자동완성 기능(searchBar_autoComplete)
		 * 같은 책에대한 bookTitle과 bookInfo의 index는 동일해야 한다
		 * DB연동후에는 bookTitle과 bookInfo에 순환문을 사용하여 정보 입력하도록 수정 필요
		 * bookInfo의 가격정보는 DB에서 정보 받아올때 LPAD사용해서 자리수 맞추어야 한다 
		 * 
		 * 문제점
		 * 한글입력시 자동완성 기능을 사용하려면 스페이스바로 한칸 띄우고 다시 백스페이스바로 돌아와야 된다
		 * 크롬을 기준으로 UI설계하여 IE에서는 검색결과가 재대로 보이지 않는다
		 * 
		 * 대안
		 * jQuery.UI api사용시 동일한 효과 구현가능?
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