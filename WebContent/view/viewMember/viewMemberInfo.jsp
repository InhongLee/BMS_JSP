<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
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
							${requestScope.memberInfo.customer_id}
						</td>
						<td style="width:50%;"></td>
					</tr>
					<tr>
						<td><label for="signIn_uPw">비밀번호</label></td>
						<td><input class="input pwChk" type="password" name="customer_pw" id="signIn_uPw"
						value="${requestScope.memberInfo.customer_pw}" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_reuPw">비밀번호 확인</label></td>
						<td><input class="input repwChk" type="password" name="customer_repw" id="signIn_reuPw" 
						value="${requestScope.memberInfo.customer_pw}" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="signIn_name">이름</label></td>
						<td><input class="input nameChk" type="text" name="customer_name" id="signIn_name"
						value="${requestScope.memberInfo.customer_name}" maxlength="20"></td>
					</tr>
					<tr>
						<td><label for="signIn_sId">주민번호</label></td>
						<td>${requestScope.memberInfo.customer_sid1}-*******</td>
					</tr>
					<tr>
						<td><label for="signIn_hp">연락처</label></td>
						<c:if test="${requestScope.memberInfo.customer_hp == null}">
							<td>
								<input class="hpChk1" type="text" name="customer_hp1" id="signIn_hp"
								maxlength="3" style="width:30px;" onkeyup="next_hp1();">
								-
								<input class="hpChk2" type="text" name="customer_hp2" maxlength="4"
								style="width:40px;" onkeyup="next_hp2();">
								-
								<input class="hpChk3" type="text" name="customer_hp3" maxlength="4"
								style="width:40px;" onkeyup="next_hp3();">
							</td>
						</c:if>
						<c:if test="${requestScope.memberInfo.customer_hp != null}">
							<c:set var="hp" value="${fn:split(requestScope.memberInfo.customer_hp,'-')}"></c:set>
							<td>
								<input class="hpChk1" type="text" name="customer_hp1" id="signIn_hp"
								value="${hp[0]}" maxlength="3" style="width:30px;">
								-
								<input class="hpChk2" type="text" name="customer_hp2"
								value="${hp[1]}" maxlength="4" style="width:40px;">
								-
								<input class="hpChk3" type="text" name="customer_hp3"
								value="${hp[2]}" maxlength="4" style="width:40px;">
							</td>
						</c:if>
					</tr>
					<tr>
						<td><label for="signIn_eMail">이메일</label></td>
						<td>
							<c:set var="email" value="${fn:split(requestScope.memberInfo.customer_email,'@')}"></c:set>
							<input class="emailChk1" type="text" name="customer_email1" id="signIn_eMail"
							value="${email[0]}" maxlength="10" style="width:100px;">
							@
							<input class="emailChk2" type="text" name="customer_email2"
							value="${email[1]}" maxlength="19" style="width:100px;">
							<select class="emailChk3" name="customer_email3" onchange="emailChk('form_info');">
								<option value="0" selected>직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					</table>
				</form>
			</div>
			<div id="myInfo_box3">
				<span id="cartBuy_title" class="title">구매 내역</span>
				<hr>
				<div id="myInfo_box4">
					<div class="buyHistory_cell1">상품명</div>
					<div class="buyHistory_cell2">정가</div>
					<div class="buyHistory_cell3">판매가</div>
					<div class="buyHistory_cell4">수량</div>
					<div class="buyHistory_cell5">합계</div>
					<div class="buyHistory_cell6">주문</div>
				</div>
				<div class="scrollBox">
					<c:forEach var="order" items="${myOrders}">
						<div class="buyHistory_addBox">
							<div class="buyHistory_cell1"><a href="viewBuyNow.do?ISBN=${order.ISBN}">${order.book_title}</a></div>
							<div class="buyHistory_cell2">${order.book_price}원</div>
							<div class="buyHistory_cell3">${order.sell_price}원</div>
							<div class="buyHistory_cell4">${order.order_quantity}권</div>
							<div class="buyHistory_cell5">${order.total_price}원</div>
							<div class="buyHistory_cell6">
							<c:if test="${order.order_state == 2110}">
								구매 요청 접수중
							</c:if>
							<c:if test="${order.order_state == 2120}">
								<input type="button" value="환불요청" class="myInfo_btn1"
							onclick="window.location='reqRefund.do?order_id=${order.order_id}';">
							</c:if>
							<c:if test="${order.order_state == 2130}">
								구매실패
							</c:if>
							<c:if test="${order.order_state == 2210}">
								환불승인 대기중
							</c:if>
							<c:if test="${order.order_state == 2220}">
								환불완료
							</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		</td></tr>
		<tr class="mainRow6"><td><div class="consoleInfo">콘솔정보창</div></td></tr>
		<tr class="mainRow7"><td><jsp:include page="/view/viewMain/viewFooter.jsp" flush="false"/></td></tr>
	</table>
	
		
	
</body>
</html>