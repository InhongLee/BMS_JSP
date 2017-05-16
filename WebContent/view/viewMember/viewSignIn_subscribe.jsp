<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../style/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/scripts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/notice.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/issue.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/JS/search.js"></script>

</head>
<body>

	<%
	String strAgree = request.getParameter("agree");
	out.println("strAgree : "+strAgree);
	String result="";
	String signIn_uId="";
	String signIn_uPw="";
	String signIn_sId="";
	String signIn_gender="";
	String signIn_eMail="";
	String signIn_url="";
	String signIn_tel="";
	String signIn_job="";
	String[] signIn_hobby;
	
	if(strAgree.equals("YES")) { 
		
		signIn_uId		= (String)session.getAttribute("signIn_uId"); 
		signIn_uPw		= (String)session.getAttribute("signIn_uPw");
		signIn_sId		= (String)session.getAttribute("signIn_sId");
		signIn_gender	= (String)session.getAttribute("signIn_gender");
		signIn_eMail	= (String)session.getAttribute("signIn_eMail");
		signIn_url		= (String)session.getAttribute("signIn_url");
		signIn_tel		= (String)session.getAttribute("signIn_tel");
		signIn_job		= (String)session.getAttribute("signIn_job");
		
		PrintWriter writer = null;
		
		try{
			String filePath = application.getRealPath("/WEB-INF/"+signIn_uId+".txt");
			writer = new PrintWriter(filePath);
			writer.println("signIn_uId: "+signIn_uId);
			writer.println("signIn_uPw:"+signIn_uPw);
			writer.println("signIn_sId:"+signIn_sId);
			writer.println("signIn_gender:"+signIn_gender);
			writer.println("signIn_eMail:"+signIn_eMail);
			writer.println("signIn_url:"+signIn_url);
			writer.println("signIn_tel:"+signIn_tel);
			writer.println("signIn_job:"+signIn_job);
			result = "SUCCESS";
		}
		catch(IOException ie) {ie.printStackTrace();result="FAIL";}
		finally {
			try{writer.close();}
			catch(Exception e){e.printStackTrace();}
		}
		
	} else {result = "FAIL";}
	session.invalidate();
	response.sendRedirect("viewSignIn_result.jsp?result="+result);
	%>	
	
</body>
</html>