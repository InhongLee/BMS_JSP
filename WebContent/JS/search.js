/**
 * 
 */
 $(document).ready(function() {
	$('input[type=search]').on('search', function () {
		// search logic here
		var searchstring = $("input[type=search]");
		searchstring.focus();
		alert("요청하신 ["+searchstring.val()+"] 을 검색중입니다...");
		$("input[type=search]").val("");
		
		
		$("#result").html("&nbsp;");
		var url = "./view/viewSales/viewBuyNow.html";
		$("#section01").load(url);
		return false;
		// this function will be executed on click of X (clear button)
	});
 });