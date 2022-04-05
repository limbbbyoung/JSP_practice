<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	String u_formId = request.getParameter("Id");
    String u_formPw = request.getParameter("Pw");
    String u_formName = request.getParameter("u_name");
    String u_formEmail = request.getParameter("u_email");
		
	try { 
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		
	    String sql = "INSERT INTO userinfo VALUE (?, ?, ?, ?)";
	     
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, u_formId);
		pstmt.setString(2, u_formPw);
		pstmt.setString(3, u_formName);
		pstmt.setString(4, u_formEmail);
		
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1><%= u_formId %>님 회원가입 축하드립니다.</h1>
</body>
</html>