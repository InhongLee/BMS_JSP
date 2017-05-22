<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lee.inhong.BMS_JSP.dto.Customer" %>
<html>
<head>
<link href="<%=request.getContextPath() %>/style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
</head>
<body>
	<% 
		Customer memberInfo = (Customer)request.getAttribute("memberInfo");
		String customer_id = memberInfo.getCustomer_id();
		String customer_pw = memberInfo.getCustomer_pw();
		String customer_name = memberInfo.getCustomer_name();
		String customer_sid1 = memberInfo.getCustomer_sid1();
		String customer_sid2 = memberInfo.getCustomer_sid2();
		String customer_hp1 =memberInfo.getCustomer_hp().substring(0, 3);
		String customer_hp2 =memberInfo.getCustomer_hp().substring(3, 7);
		String customer_hp3 =memberInfo.getCustomer_hp().substring(7, 11);
		String customer_email1 = memberInfo.getCustomer_email().substring(0, memberInfo.getCustomer_email().indexOf('@'));
		String customer_email2 = memberInfo.getCustomer_email().substring(memberInfo.getCustomer_email().indexOf('@')+1);
	%>
	<table class="mainFrame">
		<tr class="mainRow1"><td><jsp:include page="/view/viewMain/viewTitle.jsp"		flush="false"/></td></tr>
		<tr class="mainRow2"><td><jsp:include page="/view/viewMain/viewNavi.jsp" flush="false"/></td></tr>
		<tr class="mainRow3"><td><jsp:include page="/view/viewMain/viewRollUpNews.jsp" flush="false"/></td></tr>
		<tr class="mainRow4"><td><jsp:include page="/view/viewMain/viewSearch.jsp" flush="false"/></td></tr>
		<tr class="mainRow5"><td>
		<div id="myInfo_box1">
			<div id="myInfo_box2">
				<form action="viewInfo_update.do" method="post" name="form_info" id="form_info" onsubmit="return viewInfo_check();">
					<div>
						<span style="float:left;" class="title">My Information</span>
						<span style="float:right;">
							<input type="submit" value="수정">
							<input type="reset" value="초기화">
							<input type="button" value="회원탈퇴" onclick="window.location='viewSignOut.do'">
						</span>
					</div>
					<hr style="clear:both;">
					<table id="table_myInfo">
						<tr>
						<td style="width:15%; min-width:100px;"><label for="signIn_uId">아이디</label></td>
						<td style="width:35%; min-width:200px;">
							<input class="idChk" type="text" name="customer_id" id="signIn_uId" maxlength="20" placeholder="<%=customer_id%>" autofocus readonly>
						</td>
						<td style="width:50%;"></td>
					</tr>
					<tr>
						<td><label for="signIn_uPw">비밀번호</label></td>
						<td><input class="input pwChk" type="password" name="customer_pw" id="signIn_uPw" placeholder="<%=customer_pw %>" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_reuPw">비밀번호 확인</label></td>
						<td><input class="input repwChk" type="password" name="customer_repw" id="signIn_reuPw" placeholder="<%=customer_pw %>" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_name">이름</label></td>
						<td><input class="input nameChk" type="text" name="customer_name" id="signIn_name" placeholder="<%=customer_name %>" maxlength="20"></td>
					</tr>
					<tr>
						<td><label for="signIn_sId">주민번호</label></td>
						<td>
							<input class="sIdChk1" type="text" name="customer_sid1" id="signIn_sId" placeholder="<%=customer_sid1 %>" maxlength="6" style="width:60px;" onkeyup="next_sId1();">
							-
							<input class="sIdChk2" type="text" name="customer_sid2" placeholder="<%=customer_sid2 %>" maxlength="7" style="width:70px;" onkeyup="next_sId2();">
						</td>
					</tr>
					<tr>
						<td><label for="signIn_hp">연락처</label></td>
						<td>
							<input class="hpChk1" type="text" name="customer_hp1" id="signIn_hp" placeholder="<%=customer_hp1 %>" maxlength="3" style="width:30px;" onkeyup="next_hp1();">
							-
							<input class="hpChk2" type="text" name="customer_hp2" placeholder="<%=customer_hp2 %>" maxlength="4" style="width:40px;" onkeyup="next_hp2();">
							-
							<input class="hpChk3" type="text" name="customer_hp3" placeholder="<%=customer_hp3 %>" maxlength="4" style="width:40px;" onkeyup="next_hp3();">
						</td>
					</tr>
					<tr>
						<td><label for="signIn_eMail">이메일</label></td>
						<td>
							<input class="emailChk1" type="text" name="customer_email1" id="signIn_eMail" placeholder="<%=customer_email1 %>" maxlength="10" style="width:100px;">
							@
							<input class="emailChk2" type="text" name="customer_email2" placeholder="<%=customer_email2 %>" maxlength="19" style="width:100px;">
							<select class="emailChk3" name="customer_email3" onchange="emailChk();">
								<option value="0" selected>직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					</table>
				</form>
			</div>
			<div id="myInfo_box3">
				<span id="cartBuy_title" class="title">구매 내역</span>
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
					<div class="cartBuy_cell1"><a href="./view/viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
					<div class="cartBuy_cell2">35,000원</div>
					<div class="cartBuy_cell3">32,000원</div>
					<div class="cartBuy_cell4">2권</div>
					<div class="cartBuy_cell5">64,000원</div>
					<div class="cartBuy_cell6"><a href="#"><input type="button" value="환불요청" class="myInfo_btn1"></a></div>
				</div>
				<div class="cartBuy_addBox">
					<div class="cartBuy_cell1"><a href="./view/viewSales/viewBuyNow.jsp">Headfirst Java</a></div>
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