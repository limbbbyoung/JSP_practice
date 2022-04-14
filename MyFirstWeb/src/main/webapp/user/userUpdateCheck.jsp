<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
	
	String update_userId = (String)session.getAttribute("update_userId");
    String update_Pw = request.getParameter("Up_pw");
    String update_Name = request.getParameter("Up_name");
    String update_Email = request.getParameter("Up_email");	
    
    session.invalidate();
    UserDAO dao = UserDAO.getInstance();
    String update = dao.userUpdateCheck(update_userId, update_Pw, update_Name, update_Email);
    System.out.println(update);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1><%= update_userId %>님의 회원정보가 수정되었습니다.</h1>
    <a href="http://localhost:8181/JDBCPrj/user/userLoginForm.jsp">로그인창으로 돌아가기</a>
</body>
</html>