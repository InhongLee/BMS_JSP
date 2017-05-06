/**
 * 
 */
$(document).ready(function() {
		$(window).load(function() {
			$(".sub_menu").hide();
			$('#section01').load('./view/viewLogIn.html');
			return false;
		});
		
		$(".navi a").click(function() {
			return false;
		});
		$(".notice-list li a").click(function() {
			return false;
		});
		$(".book-list li a").click(function() {
			return false;
		});
		$("#sales").mouseover(function() {
			$("#sub_sales").show();
		});
		$("#sales").mouseout(function() {
			$("#sub_sales").hide();
		});
		
		$("#stock").mouseover(function() {
			$("#sub_stock").show();
		});
		$("#stock").mouseout(function() {
			$("#sub_stock").hide();
		});
		
		$("#order").mouseover(function() {
			$("#sub_order").show();
		});
		$("#order").mouseout(function() {
			$("#sub_order").hide();
		});
		
		$("#member").mouseover(function() {
			$("#sub_member").show();
		});
		$("#member").mouseout(function() {
			$("#sub_member").hide();
		});
		
		$("#account").mouseover(function() {
			$("#sub_account").show();
		});
		$("#account").mouseout(function() {
			$("#sub_account").hide();
		});

		$('.navi a').click(function() {
			var url = $(this).attr('href');
			$('#section01').load(url);
			return false;
		});
		$(".notice-list li a").click(function() {
			var url_notice = $(this).attr('href');
			$('#section01').load(url_notice);
			return false;
		});	
	});