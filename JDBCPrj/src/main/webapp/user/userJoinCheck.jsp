<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
	String userId = request.getParameter("Id");
    String userPw = request.getParameter("Pw");
    String userName = request.getParameter("u_name");
    String Email = request.getParameter("u_email");
    
    UserDAO dao = new UserDAO();
   	String idAdd = dao.userJoinCheck(userId, userPw, userName, Email);
   	System.out.println(idAdd);
     
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1><%= userId %>님 회원가입 축하드립니다.</h1>
</body>
</html>