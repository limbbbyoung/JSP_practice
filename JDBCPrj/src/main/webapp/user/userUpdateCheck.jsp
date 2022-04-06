<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	String update_userId = (String)session.getAttribute("update_userId");
	String update_Id = request.getParameter("Up_Id");
    String update_Pw = request.getParameter("Up_pw");
    String update_Name = request.getParameter("Up_name");
    String update_Email = request.getParameter("Up_email");	
	try { 
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		
	    String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";
	     
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(4, update_Id);
		pstmt.setString(1, update_Pw);
		pstmt.setString(2, update_Name);
		pstmt.setString(3, update_Email);
		
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
    <h1><%= update_userId %>님의 회원정보가 수정되었습니다.</h1>
</body>
</html>