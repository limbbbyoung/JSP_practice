<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션파기
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>로그아웃 되었습니다.</h1>
     <%
     response.sendRedirect("http://localhost:8181/MyFirstWeb/user/userLoginForm.jsp");
     %>
</body>
</html>