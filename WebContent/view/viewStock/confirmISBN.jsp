<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/view/setting.jsp" %>
<html>
<body>

	<form action="confirmISBN.do" method="post" name="confirmISBNForm"
	ousubmit="return confirmISBNCheck();">
		<c:if test="${checkCnt == 1}">
			<table>
				<tr>
					<th colspan="2"><span>${ISBN}</span> 는 사용할 수 없습니다.	</th>
				</tr>
				<tr>
					<th>ISBN </th>
					<td><input type="text" name="ISBN" maxlength="13" style="width:100px"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="self.close();">
					</th>
				</tr>
			</table>
		</c:if>
		<c:if test="${checkCnt == 0}">
			<table>
				<tr>
					<td align="center"><span>${ISBN}</span>는 사용할 수 있습니다.</td>
				</tr>
				<tr>
					<th><input type="button" value="확인" onclick="setISBN('${ISBN}');"></th>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>