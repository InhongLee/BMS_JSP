/**
 * 
 */


$(document).ready(function() {
	$(window).load(function()							{$(".sub_menu").hide();
														return false;												});
	$("#sales").mouseover(function()					{$("#sub_sales").show();									});
	$("#sales").mouseout(function()						{$("#sub_sales").hide();									});
	$("#stock").mouseover(function()					{$("#sub_stock").show();									});
	$("#stock").mouseout(function()						{$("#sub_stock").hide();									});
	$("#order").mouseover(function()					{$("#sub_order").show();									});
	$("#order").mouseout(function()						{$("#sub_order").hide();									});
	$("#member").mouseover(function()					{$("#sub_member").show();									});
	$("#member").mouseout(function()					{$("#sub_member").hide();									});
	$("#board").mouseover(function()					{$("#sub_board").show();									});
	$("#board").mouseout(function()					{$("#sub_board").hide();									});

	$(".inputButton").bind(								{
		"mouseenter":function() 						{$(this).css("color","yellow");
											 			 $(this).css("text-shadow","0px 2px 2px black");			},
		"mouseleave":function() 						{$(this).css("color","white");
														 $(this).css("text-shadow","none");							}});
	$("input").focus(function() 						{var msgId = $(this).attr("name");	console(msgId);			});
	$("input").focusout(function()						{$(".consoleInfo").html("");								});
	$("input[type='submit']").mouseenter(function()		{$(".consoleInfo").html(submit);							});
	$("input[type='submit']").mouseleave(function()		{$(".consoleInfo").html("");								});
	$("input[type='reset']").mouseenter(function()		{$(".consoleInfo").html(reset);								});
	$("input[type='reset']").mouseleave(function()		{$(".consoleInfo").html("");								});
	$("input[type='button']").mouseenter(function()		{var msgId = $(this).attr("value");	console(msgId);			});
	$("input[type='button']").mouseleave(function()		{$(".consoleInfo").html("");								});
	/**************************************************************************/
	/* tab menu interface */
	/**************************************************************************/
	$(".tab_content").hide();
	$("ul.tabs li:first").addClass("active").show();
	$(".tab_content:first").show();
	
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn();
		return false;
	});

	/**************************************************************************/
	/* table interface */
	/**************************************************************************/
	$("#stock_table1 td").click(function() {
		var col = $(this).parent().children().index($(this));
		var row = $(this).parent().parent().children().index($(this).parent());
		
		var colName = $("#stock_table1 th").eq(col).html();
		if(colName == "Title"||colName == "Author"||colName == "Cost"||colName == "Price"||colName == "State") {
			var placeholder = $(this).html();
			
			if(placeholder.indexOf("<input") == -1 && placeholder.indexOf("<select") == -1) {
				if(colName == "Title") {
					$(this).html("<input type='text' placeholder='"+placeholder+"'>");
				} else if(colName == "Author") {
					$(this).html("<input type='text' placeholder='"+placeholder+"'>");
				} else if(colName == "Cost") {
					$(this).html("<input type='number' placeholder='"+placeholder+"'>");
				} else if(colName == "Price") {
					$(this).html("<input type='number' placeholder='"+placeholder+"'>");
				}else if (colName == "State") {
					var defaultVar = $(this).html();
					$(this).html("<select>"+
							"<option readonly>SELECT State</option>"+
							"<option value = 'PENDING'>PENDING</option>"+
							"<option value = 'ON_SALE'>ON_SALE</option>"+
							"<option value = 'SOLD_OUT'>SOLD_OUT</option>"+
							"<option value = 'OUT_OF_PRINT'>OUT_OF_PRINT</option>"+
							"</select>");
				}
				$(this).children().focus();
			}
		} else if (colName == "Stock") {
			var $ISBN = $(this).parent().children().eq(0).html();
			var activeTab = $(".active").find("a").attr("href");
			$(activeTab + " td").eq(1).html($(this).parent().children().eq(3).html());
			$(activeTab + " input[type='number']").focus();
			$(activeTab + " input[name='ISBN']").val($ISBN);
		} 
		return false;
	});
	
/**************************************************************************************/	
	$("#stock_table1 td").unbind("keyup");
	$("#stock_table1 td").bind("keyup", (function(key) {
		key.stopPropagation(); 
		if(key.keyCode == 13) {
			var $ISBN = $(this).parent().children().eq(0).html();
			var $col = $(this).parent().children().index($(this));
			var $cellValue = $(this).children().val();
			if($cellValue == "") {
				$cellValue = $(this).children().attr("placeholder");
			}
			$(this).html($cellValue);
			var data = {
					ISBN: $ISBN,
					columnNo: $col,
					updateStr: $cellValue,
					test: 'ok'
			}
			$.post('stockUpdate.do', data);
			return false;
		}			
		
	}));		

	$("#stock_table1 td").change(function() {
		if($(this).children().get(0).tagName == "SELECT") {
			event.preventDefault();
			var $ISBN = $(this).parent().children().eq(0).html();
			var $col = $(this).parent().children().index($(this));
			var $cellValue = $(this).children().val();
			$(this).html($cellValue);
			var data = {
					ISBN: $ISBN,
					columnNo: $col,
					updateStr: $cellValue,
					test: 'ok'
			}
			$.post('stockUpdate.do', data);
			return false;
		}
	});

/****************************************************************************************/
	$("#order_table1 td").click(function() {
		var col = $(this).parent().children().index($(this));
		var row = $(this).parent().parent().children().index($(this).parent());
		
		var colName = $("#order_table1 th").eq(col).html();
		var reqState = $(this).parent().children().eq(8).html();
		if (colName == "order_state") {
			var activeTab;
			var $order_id = $(this).parent().children().eq(0).html();
			var $purchase_price = $(this).parent().children().eq(4).html();
			var $sell_price = $(this).parent().children().eq(5).html();
			var $order_quantity = $(this).parent().children().eq(7).html();
			var $order_state = $(this).parent().children().eq(8).attr("id");
			
			$("ul.tabs li").removeClass("active");
			
			if(reqState.indexOf("REQ_PURCHASE") != -1) {
				$("ul.tabs li:eq(0)").addClass("active");
				$(".tab_content").hide();
				activeTab = $("ul.tabs li:eq(0)").find("a").attr("href");
			} else if(reqState.indexOf("REQ_SALES") != -1) {
				$("ul.tabs li:eq(1)").addClass("active");
				$(".tab_content").hide();
				activeTab = $("ul.tabs li:eq(1)").find("a").attr("href");
			} else if(reqState.indexOf("REQ_REFUND") != -1) {
				$("ul.tabs li:eq(2)").addClass("active");
				$(".tab_content").hide();
				activeTab = $("ul.tabs li:eq(2)").find("a").attr("href");
			} else if(reqState.indexOf("REQ_RETURN") != -1) {
				$("ul.tabs li:eq(3)").addClass("active");
				$(".tab_content").hide();
				activeTab = $("ul.tabs li:eq(3)").find("a").attr("href");
			}
			
			$(activeTab + " #order_orderId").html($order_id);
			var $price = 0;
			if($(activeTab + " form").attr("name") == "order_req1") {
				$price = $purchase_price;
			} else if ($(activeTab + " form").attr("name") == "order_req2") {
				$price = $sell_price;
			} else if ($(activeTab + " form").attr("name") == "order_req3") {
				$price = $sell_price;
			} else if ($(activeTab + " form").attr("name") == "order_req4") {
				$price = $purchase_price;
			}
			$(activeTab + " #order_price").html($price);
			$(activeTab + " #order_orderQty").html($order_quantity);
			var orderSum = $order_quantity * $sell_price;
			$(activeTab + " #order_orderSum").html(orderSum);
			$(activeTab).fadeIn();
			$(activeTab + " input[name='order_id']").val($order_id);
			$(activeTab + " input[name='order_state']").val($order_state);
			$(activeTab + " input[type='submit']").focus();

		}
		return false;
	});
	
	
	/****************************************************************************************/	
});

function viewLogIn_check() { //로그인 정보(id,pw)입력 후 로그인 버튼 클릭 > 입력정보 검증
	var activeTab = $(".active").find("a").attr("href");
	if(!$(activeTab + " .idChk").val()) {
		$(".consoleInfo").html(msg_id);
		$(".idChk").focus();
		return false;
	}
	else if(!$(activeTab + " .pwChk").val()) {
		$(".consoleInfo").html(msg_pwd);
		$(".pwChk").focus();
		return false;
	}
	else {
		$(".consoleInfo").html("&nbsp;");
		var strId = $(activeTab + " #strId").val();
		var strPw = $(activeTab + " #strPw").val();
		var tabNo = $(activeTab + " #tabNo").val();
	}
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
	else if(!document.form_signIn.customer_sid1.value)	{$(".consoleInfo").html(msg_sId);	document.form_signIn.customer_sid1.focus();	return false;}
	else if(!document.form_signIn.customer_sid2.value)	{$(".consoleInfo").html(msg_sId);	document.form_signIn.customer_sid2.focus();	return false;}
	else if(!document.form_signIn.customer_email1.value){$(".consoleInfo").html(msg_email);	document.form_signIn.customer_email1.focus();return false;}
	else if(!document.form_signIn.customer_email2.value){$(".consoleInfo").html(msg_email);	document.form_signIn.customer_email2.focus();return false;}
	else if(document.form_signIn.hiddenId.value == 0)	{$(".consoleInfo").html(msg_confirmId);document.form_signIn.hiddenId.focus();	return false;}
	
	var req_id = /^[0-9a-zA-Z]{6,20}$/; //아이디 유효성검사
	var $customer_id = $(".idChk");
	var result_id = req_id.test($customer_id.val());
	if(!result_id)										{$(".consoleInfo").html(msg_idChk); $customer_id.val(""); $customer_id.focus(); return false;}
	
	var reg_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,10}$/; //비밀번호 유효성검사
	var $customer_pw = $(".pwChk");
	var result_pw = reg_pw.test(customer_pw.val());
	if(!result_pw)										{$(".consoleInfo").html(msg_pwdChk); $customer_pw.val(""); $customer_pw.focus(); return false;}
		
	var reg_name = /^[가-힣]{2,5}$/; //이름 유효성검사
	var $customer_name = $(".nameChk");
	var result_name = reg_name.test(customer_name.val());
	if(!result_name) 									{$(".consoleInfo").html(msg_nameChk); $customer_name.val(""); $customer_name.focus();	return false;}
	
	var reg_sId1 = /^\d{6}$/; //주민번호 유효성 검사
	var reg_sId2 = /^(1|2|3|4)\d{6}$/;
	var $customer_sid1 = $(".sIdChk1");
	var $customer_sid2 = $(".sIdChk2");
	var result_sId1 = reg_sId1.test(customer_sid1.val());
	var result_sId2 = reg_sId2.test(customer_sid2.val());
	if(!result_sId1)									{$(".consoleInfo").html(msg_sIdChk); $customer_sid1.val(""); $customer_sid1.focus(); return false;}
	else if(!result_sId2)								{$(".consoleInfo").html(msg_sIdChk); $customer_sid2.val(""); $customer_sid2.focus(); return false;}
	
	var reg_hp1 = /^01(?:0|1|[6-9])$/; //전화번호 유효성 검사
	var reg_hp2 = /^(?:\d{3}|\d{4})$/;
	var reg_hp3 = /^\d{4}$/;
	var $customoer_hp1 = $(".hpChk1");
	var $customoer_hp2 = $(".hpChk2");
	var $customoer_hp3 = $(".hpChk3");
	var result_hp1 = reg_hp1.test(customoer_hp1.val());
	var result_hp2 = reg_hp2.test(customoer_hp2.val());
	var result_hp3 = reg_hp3.test(customoer_hp3.val());
	if		(!result_hp1)								{$(".consoleInfo").html(msg_hp);	$customoer_hp1.val("");	$customoer_hp1.focus();	return false;}
	else if	(!result_hp2)								{$(".consoleInfo").html(msg_hp);	$customoer_hp2.val("");	$customoer_hp2.focus();	return false;}
	else if	(!result_hp3)								{$(".consoleInfo").html(msg_hp);	$customoer_hp3.val("");	$customoer_hp3.focus();	return false;}
	
	var tld = [".co.kr",".com",".net",".or.kr",".org",".go.kr"]; //이메일 유효성 검사
	var reg_email1 = /^[_0-9a-zA-Z\-]+$/; 
	var reg_email2 = /^[0-9a-zA-Z\-]+(\.[_0-9a-zA-Z\-]+)*$/;
	var $customer_email1 = $(".emailChk1");
	var $customer_email2 = $(".emailChk2");
	var result_email1 = reg_email1.test(customer_email1.val());
	var result_email2 = reg_email2.test(customer_email2.val());
	var checkTLD;
	for(var i in tld) 									{checkTLD = (customer_email2.value.indexOf(tld[i]) == -1) ? false : true; if(checkTLD) break;}
	if		(!result_email1)							{$(".consoleInfo").html(msg_emailChk); $customer_email1.val(""); $customer_email1.focus(); return false;}
	else if	(!result_email2)							{$(".consoleInfo").html(msg_emailChk); $customer_email2.val(""); $customer_email2.focus(); return false;}
	else if	(!checkTLD) 								{$(".consoleInfo").html(msg_emailChk); $customer_email2.val(""); $customer_email2.focus(); return false;}	
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
/*************************************************************************************************************************************************************/
/*viewMemberInfo.jsp																																		 */
/*************************************************************************************************************************************************************/
function viewInfo_check() { //회원정보 수정(id,pw,이름,주민번호,연락처,이메일)입력 후 수정 버튼 클릭 > 입력정보 검증
	if($(".pwChk").val() != $(".repwChk").val()) //비밀번호 != 비밀번호 확인
														{$(".consoleInfo").html(msg_repwdChk);
														 $(".pwChk").val("");
														 $(".repwChk").val("");
														 $(".pwChk").focus();
														 return false;}
	var reg_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,10}$/; //비밀번호 유효성검사
	var $customer_pw = $(".pwChk");
	var result_pw = reg_pw.test(customer_pw.val());
	if(!result_pw)										{$(".consoleInfo").html(msg_pwdChk); $customer_pw.val(""); $customer_pw.focus(); return false;}
		
	var reg_name = /^[가-힣]{2,5}$/; //이름 유효성검사
	var $customer_name = $(".nameChk");
	var result_name = reg_name.test(customer_name.val());
	if(!result_name) 									{$(".consoleInfo").html(msg_nameChk); $customer_name.val(""); $customer_name.focus();	return false;}

	var reg_hp1 = /^01(?:0|1|[6-9])$/; //전화번호 유효성 검사
	var reg_hp2 = /^(?:\d{3}|\d{4})$/;
	var reg_hp3 = /^\d{4}$/;
	var $customoer_hp1 = $(".hpChk1");
	var $customoer_hp2 = $(".hpChk2");
	var $customoer_hp3 = $(".hpChk3");
	var result_hp1 = reg_hp1.test(customoer_hp1.val());
	var result_hp2 = reg_hp2.test(customoer_hp2.val());
	var result_hp3 = reg_hp3.test(customoer_hp3.val());
	if		(!result_hp1)								{$(".consoleInfo").html(msg_hp);	$customoer_hp1.val("");	$customoer_hp1.focus();	return false;}
	else if	(!result_hp2)								{$(".consoleInfo").html(msg_hp);	$customoer_hp2.val("");	$customoer_hp2.focus();	return false;}
	else if	(!result_hp3)								{$(".consoleInfo").html(msg_hp);	$customoer_hp3.val("");	$customoer_hp3.focus();	return false;}
	
	var tld = [".co.kr",".com",".net",".or.kr",".org",".go.kr"]; //이메일 유효성 검사
	var reg_email1 = /^[_0-9a-zA-Z\-]+$/; 
	var reg_email2 = /^[0-9a-zA-Z\-]+(\.[_0-9a-zA-Z\-]+)*$/;
	var $customer_email1 = $(".emailChk1");
	var $customer_email2 = $(".emailChk2");
	var result_email1 = reg_email1.test(customer_email1.val());
	var result_email2 = reg_email2.test(customer_email2.val());
	var checkTLD;
	for(var i in tld) 									{checkTLD = (customer_email2.value.indexOf(tld[i]) == -1) ? false : true; if(checkTLD) break;}
	if		(!result_email1)							{$(".consoleInfo").html(msg_emailChk); $customer_email1.val(""); $customer_email1.focus(); return false;}
	else if	(!result_email2)							{$(".consoleInfo").html(msg_emailChk); $customer_email2.val(""); $customer_email2.focus(); return false;}
	else if	(!checkTLD) 								{$(".consoleInfo").html(msg_emailChk); $customer_email2.val(""); $customer_email2.focus(); return false;}

}

/**************************************************************************/
/*	viewStock.jsp	*/
/**************************************************************************/
function totalCostChk(formname) {
	var $reqQty = $("form[name='"+formname+"'] #reqQty").val();
	var $cost = parseInt($("form[name='"+formname+"'] #stock_cost").html());
	var $totalCost = $reqQty * $cost;
	var activeTab = $(".active").find("a").attr("href");
	$(activeTab + " td").eq(7).html("-"+$totalCost);
	
	return false;
}

function stockOpReset() { //검색 초기화
	$("input[name='searchTitleAuthor']").val("");
	$("select[name='searchPublisher']").val("0");
	$("input[name='searchStockQty']").val("0");
	$("select[name='searchStockState']").val("0");
}

function addBook() {
	var url = "addBook.do";
	window.open(url, "addBook", "toolbar=no,location=no,status=no,resizable=no,menubar=no,width=500,height=500");
}

function addPicture() {
	if(document.addBookProForm.hiddenId.value == 0) {
		document.addBookProForm.dupcheck.focus();
		return false;
	}
	var ISBN = document.addBookProForm.ISBN.value;
	var url = "addPicture.do?ISBN="+ISBN;
	window.open(url, "addPicture", "toolbar=no,location=no,status=no,resizable=no,menubar=no,width=500,height=500");
}

function addPictureFormCheck() {
	if(!document.addPictureForm.file.value) {
		alert(msg_addPicture);
		document.addPictureForm.file.focus();
		return false;
	}
	var fileName = document.addPictureForm.file.value;
	var check = fileName.indexOf(".");
	var check2 = fileName.slice(check);
	if(check2 != '.jpg') {
		alert(msg_jpgError);
		document.addPictureForm.file.focus();
		return false;
	}
}
function addBookCheck() {
	if(!document.addBookProForm.ISBN.value) {
		$(".consoleInfo").html(msg_isbn);
		document.addBookProForm.ISBN.focus();
		return false;
	} else if(document.addBookProForm.searchPublisher.value == 0) {
		$(".consoleInfo").html(msg_publisher_id);
		document.addBookProForm.searchPublisher.focus();
		return false;	} else if(!document.addBookProForm.book_title.value) {
		$(".consoleInfo").html(msg_book_title);
		document.addBookProForm.book_title.focus();
		return false;
	} else if(!document.addBookProForm.book_author.value) {
		$(".consoleInfo").html(msg_book_author);
		document.addBookProForm.book_author.focus();
		return false;
	} else if(!document.addBookProForm.purchase_price.value) {
		$(".consoleInfo").html(msg_purchase_price);
		document.addBookProForm.purchase_price.focus();
		return false;
	} else if(!document.addBookProForm.sell_price.value) {
		$(".consoleInfo").html(msg_sell_price);
		document.addBookProForm.sell_price.focus();
		return false;
	} else if(document.addBookProForm.hiddenId.value == 0) {
		$(".consoleInfo").html(msg_dupCheck);
		document.addBookProForm.dupcheck.focus();
		return false;
	}
}

function dupCheck() { //회원가입 페이지에서 입력한 id가 이미 있는 아이디인지 확인
	if(!document.addBookProForm.ISBN.value)			{$(".consoleInfo").html(msg_isbn);	document.addBookProForm.ISBN.focus();	return false;}
	var ISBN = document.addBookProForm.ISBN.value;
	var url = "confirmISBN.do?ISBN=" + ISBN;
	window.open(url, "confirm", "menubar=no, width=300, height=200");
}

function setISBN(isbn) {
	opener.document.addBookProForm.ISBN.value = isbn;
	opener.document.addBookProForm.hiddenId.value = 1;
	self.close();
}

function resetHiddenId() {
	document.addBookProForm.hiddenId.value = 0;
}



function fnStockOpSearch() {
	var searchText = document.stockOpSearchForm.searchTitleAuthor.value;
	var searchPub = document.stockOpSearchForm.searchPublisher.value;
	var searchStat = document.stockOpSearchForm.searchStockState.value;
	var searchQty = document.stockOpSearchForm.searchStockQty.value;
	$('#listStock').load('stockOpSearch.do?searchTitleAuthor='+searchText
							+'&searchPublisher='+searchPub
							+'&searchStockState='+searchStat
							+'&searchStockQty='+searchQty);
	return false;
}
/**************************************************************************/
/*	viewOrder.jsp	*/
/**************************************************************************/
function confirmCheck(formname) {
	var $order_state = $("form[name='"+formname+"'] input[name='order_state']").val();
	if($order_state != 1110 && $order_state != 1210 && $order_state != 2110 && $order_state != 2210) {
		alert(orderConfirmError);
		return false;
	}
}

function rejectOrder(formname) { // 승인거부
	var $order_state = $("form[name='"+formname+"'] input[name='order_state']").val();
	if($order_state != 1110 && $order_state != 1210 && $order_state != 2110 && $order_state != 2210) {
		alert(orderRejectError);
		return false;
	} else {
		var $order_id = $("form[name='"+formname+"'] input[name='order_id']").val();
		$("form[name='"+formname+"'] input[name='order_id']").val("");
		window.location="rejectOrder.do?order_id="+$order_id+"&order_state="+$order_state;		
	}
}
function orderOpReset() {
	$("input[name='order_StartDate']").val("");
	$("input[name='order_StartDate']").val("");
	$("select[name='selectOrderState']").val("0");
	$("select[name='selectOrderApproval']").val("0");
}

function fnOrderOpSearch() {
	var searchTitleAuthor = document.orderOpSearchForm.searchTitleAuthor.value;
	var order_StartDate = document.orderOpSearchForm.order_StartDate.value;
	var order_EndDate = document.orderOpSearchForm.order_EndDate.value;
	var selectOrderType = document.orderOpSearchForm.selectOrderType.value;
	var selectOrderState = document.orderOpSearchForm.selectOrderState.value;
	$('#listOrder').load('orderOpSearch.do?searchTitleAuthor='+searchTitleAuthor
							+'&order_StartDate='+order_StartDate
							+'&order_EndDate='+order_EndDate
							+'&selectOrderType='+selectOrderType
							+'&selectOrderState='+selectOrderState);
	return false;
}



/**************************************************************************/
/*	board	*/
/**************************************************************************/
function passwdCheck() {
	if(!document.passwdform.passwd.value) {
		alert(msg_passwd);
		document.passwdform.passwd.focus();
		return false;}
}
function modifyCheck() {
	if(!document.modifyform.subject.value) {
		alert(msg_subject);
		document.modifyform.subject.focus();
		return false;
	} else if(!document.modifyform.passwd.value) {
		alert(msg_passwd);
		document.modifyform.passwd.focus();
		return false;
	}
}
function writeCheck() {
	if(!document.writeform.writer.value) {
		alert(msg_writer);
		document.writeform.writer.focus();
		return false;
	} else if(!document.writeform.passwd.value) {
		alert(msg_passwd);
		document.writeform.passwd.focus();
		return false;
	} else if(!document.writeform.subject.value) {
		alert(msg_subject);
		document.writeform.subject.focus();
		return false;
	}
}
function writeFocus() {
	document.writeform.writer.focus();
}
function modifyFocus() {
	document.modifyform.subject.focus();
}
function passwdFocus() {
	document.passwdform.passwd.focus();
}
/**************************************************************************/
/*	공유 script	*/
/**************************************************************************/
function errorAlert(msg) { //미리 설정된 에러메시지 표시 후 이전페이지로 이동
	alert(msg);
	window.history.back();
}

function console(msg) { //콘솔창에 메시지 표시
	$(".consoleInfo").html(eval(msg));
}

function initFocus(formId) { //페이지 로드 시 폼의 첫번째 입력위치로 포커스 이동 해당페이지의 if문 주의
	var target = document.getElementById(formId).getElementsByTagName('input');
	target[0].focus();
}

function emailChk(formId) { //이메일 드롭다운 직접입력외의 선택시 자동삽입
	var form = document.getElementById(formId);
	if(form.customer_email3.value != 0) {
		form.customer_email2.value = form.customer_email3.value;
		form.customer_email2.setAttribute("disabled",true);
	} else if(form.customer_email3.value == 0) {
		form.customer_email2.value = "";
		form.customer_email2.removeAttribute("disabled");
		form.customer_email2.focus();
	}	
}

function autoTab(formId, preId, setNum, postId) { //입력문자수setNum에 도달하면 preId에서 postId로 포커스이동
	var $preId = $('#'+formId+' #'+preId);
	var $postId = $('#'+formId+' #'+postId);
	if($preId.val().length >= setNum) {
		$postId.focus();}
}
/**************************************************************************/
/* 공지사항 롤링바 구현 javascript */
/**************************************************************************/
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

/**************************************************************************/
/* 메인페이지 좌우 자동 이동 구현 */
/**************************************************************************/
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



