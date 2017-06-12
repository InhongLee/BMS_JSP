<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/setting.jsp" %>
<html>
<body>
<h2 style="text-align: center;">책 추가</h2>
<form action="addBookPro.do" method="post" name="addBookProForm"
onsubmit="return addBookCheck();">
	<table border="1" align="center" style="border-collapse: collapse; width:400px;">
		<tr>
			<th width="100px">ISBN</th>
			<td width="250px">
				<input class="input" type="text" name="ISBN" maxlength="13"
				onchange="resetHiddenId();">
			<td>
			<td width="50px"><input type="button" name="dupcheck" value="중복확인" onclick="dupCheck();"></td>
		</tr>
		<tr>
			<th>publisher_id</th>
			<td colspan="3">
				<select class="input fontSizeM" name="searchPublisher">
					<option value="0">출판사 선택</option>
					<c:forEach var="publisher" items="${publishers}">
						<option value="${publisher.publisher_id}">${publisher.publisher_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>book_title</th>
			<td colspan="3"><input class="input" type="text" name="book_title" maxlength="255"></td>
		</tr>
		<tr>
			<th>book_author</th>
			<td colspan="3"><input class="input" type="text" name="book_author" maxlength="50"></td>
		</tr>
		<tr>
			<th>purchase_price</th>
			<td colspan="3"><input class="input" type="number" name="purchase_price" maxlength="6"
				min="0" step="100"></td>
		</tr>
		<tr>
			<th>sell_price</th>
			<td colspan="3"><input class="input" type="number" name="sell_price" maxlength="6"
				min="0" step="100"></td>
		</tr>
		<tr>
			<th class="consoleInfo" height="30" colspan="4" style="color: black;"></th>
		</tr>
		<tr>
			<th colspan="4">
				<input type="button" value="사진업로드" onclick="addPicture();">
				<input type="submit" value="등록">
				<input type="reset" value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.close();">
			</th>
		</tr>
	</table>
	<input type="hidden" name="hiddenId" value="0">
</form>
</body>
</html>