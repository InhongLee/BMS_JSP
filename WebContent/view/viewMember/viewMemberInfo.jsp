<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#myInfo_box1{/*border: 1px solid green; */}
	#myInfo_box2{border:1px solid green;}
	#myInfo_form{margin:10px;}
	#table_myInfo{border-collapse:collapse;}
	#table_myInfo tr{height:25px; background-color:white;}
	#table_myInfo input, #table_myInfo select{border:1px solid green;}
	#myInfo_box3{margin-top:10px; padding:10px; border:1px solid green;}
	#myInfo_box4{margin-top:10px; text-align:center; color:white; background:green;}
	.myInfo_title{font-size:large; font-weight:bold;}
</style>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("td").eq(0).css("width","120px");
		$("#myInfo_signOut").click(function() {
			window.location.replace("../viewMember/viewSignOut.jsp");
			return false;
		});
	});
</script>
</head>
<body>

	<table class="mainFrame">
		<tr class="mainRow1"><td><div class="title"><h1><a href="<%=request.getContextPath() %>/index.jsp">Book Management System</a></h1></div></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="myInfo_box1">
			<div id="myInfo_box2">
				<form name="myInfo" action="" method="post" id="myInfo_form">
					<div>
						<span style="float:left;" class="myInfo_title">My Infomation</span>
						<span style="float:right;">
							<input type="submit" value="수정" class="">
							<input type="reset" value="초기화" class="">
							<input type="button" value="회원탈퇴" id="myInfo_signOut">
						</span>
					</div>
					<hr style="clear:both;">
					<table id="table_myInfo">
						<tr>
							<td><label for="signIn_uId">아이디</label></td>
							<td><input type="text" name="signIn_uId" id="signIn_uId" placeholder="userId" readonly></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<input type="radio" name="signIn_gender" id="signIn_gen_m" value="남자" checked>
								<label for="signIn_gen_m">남자&nbsp;&nbsp;</label>
								<input type="radio" name="signIn_gender" id="signIn_gen_w" value="여자">
								<label for="signIn_gen_w">여자</label>
							</td>
						</tr>
						<tr>
							<td><label for="signIn_eMail">이메일</label></td>
							<td><input type="email" name="signIn_eMail" id="signIn_eMail" placeholder="amaco78@gmail.com"></td>
						</tr>
						<tr>
							<td><label for="signIn_url">URL</label></td>
							<td><input type="url" name="signIn_url" id="signIn_url" placeholder="http://www.amaco.com"></td>
						</tr>
						<tr>
							<td><label for="signIn_tel">전화번호</label></td>
							<td><input type="tel" name="signIn_tel" id="signIn_tel" placeholder="01097833038"></td>
						</tr>
						<tr>
							<td>취미</td>
							<td>
								<input type="checkbox" name="signIn_hobby" id="signIn_hobby1" value="축구">
								<label for="signIn_hobby1">축구&nbsp;&nbsp;</label>
								<input type="checkbox" name="signIn_hobby" id="signIn_hobby2" value="야구" checked="checked">
								<label for="signIn_hobby2">야구&nbsp;&nbsp;</label>
								<input type="checkbox" name="signIn_hobby" id="signIn_hobby3" value="수영">
								<label for="signIn_hobby3">수영</label>
							</td>
						</tr>
						<tr>
							<td><label for="signIn_job">직업</label></td>
							<td>
								<select name="signIn_job" id="signIn_job">
									<option>직업을 선택하세요.</option>
									<option value="프로그래머" selected="selected">프로그래머</option>
									<option value="건물주">건물주</option>
									<option value="금수저">금수저</option>
									<option value="아이돌">아이돌</option>
									<option value="작사가">작사가</option>
									<option value="랩퍼">랩퍼</option>
								</select>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="myInfo_box3">
				<span id="cartBuy_title" class="myInfo_title">구매 내역</span>
				<hr>
				<div id="myInfo_box4">
					<div class="cartBuy_cell1">상품명</div>
					<div class="cartBuy_cell2">정가</div>
					<div class="cartBuy_cell3">판매가</div>
					<div class="cartBuy_cell4">수량</div>
					<div class="cartBuy_cell5">합계</div>
					<div class="cartBuy_cell6">주문</div>
				</div>
				<div class="cartBuy_addBox">
					<div class="cartBuy_cell1"><a href="./view/viewSales/viewBuyNow.html">Headfirst Java</a></div>
					<div class="cartBuy_cell2">35,000원</div>
					<div class="cartBuy_cell3">32,000원</div>
					<div class="cartBuy_cell4">2권</div>
					<div class="cartBuy_cell5">64,000원</div>
					<div class="cartBuy_cell6"><a href="#"><input type="button" value="환불요청" class="myInfo_btn1"></a></div>
				</div>
				<div class="cartBuy_addBox">
					<div class="cartBuy_cell1"><a href="./view/viewSales/viewBuyNow.html">Headfirst Java</a></div>
					<div class="cartBuy_cell2">35,000원</div>
					<div class="cartBuy_cell3">32,000원</div>
					<div class="cartBuy_cell4">2권</div>
					<div class="cartBuy_cell5">64,000원</div>
					<div class="cartBuy_cell6"><a href="#"><input type="button" value="환불요청" class="myInfo_btn1"></a></div>
				</div>
			</div>
			
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
		
	
</body>
</html>