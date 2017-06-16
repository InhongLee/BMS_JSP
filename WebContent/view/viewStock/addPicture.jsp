<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/view/setting.jsp" %>
<html>
<body>
<h2 style="text-align: center;">사진 추가</h2>
 	<form method="POST" action="upload" enctype="multipart/form-data"
 	name="addPictureForm" onsubmit="return addPictureFormCheck();">
		<table border="1" style="border-collapse: collapse; width:400px; text-align: center;">
			<tr>
				<th colspan="2">
					이미지 업로드는 확장자가 .jpg인 파일만 가능합니다.
				</th>
			</tr>
			<tr>
				<th>파일선택</th>
				<td><input type="file" name="file" id="file" /></td>			
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="업로드" name="upload" id="upload" />
					<input type="reset" value="재선택">
					<input type="button" value="취소" onclick="window.close();">
				</th>
			</tr>
		</table>
		<input type="hidden" value="C:\DEV\workspace\lee.inhong.BMS_JSP\WebContent\images" name="destination"/>
		<input type="hidden" value="${ISBN}" name="ISBN">
	</form>
</body>
</html>