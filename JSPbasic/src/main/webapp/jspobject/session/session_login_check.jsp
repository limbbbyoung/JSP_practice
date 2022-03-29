<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	System.out.println(userId);
	System.out.println(userPw);
	if(userId.equals("abcd1234")){
		if(userPw.equals("1111")){
			session.setAttribute("session_id", "abcd1234");
		}
	}
	out.println((String)session.getAttribute("session_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>