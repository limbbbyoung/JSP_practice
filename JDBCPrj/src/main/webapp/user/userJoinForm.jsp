<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h1>회원가입하기</h1>
     <form action="http://localhost:8181/JDBCPrj/user/userJoinCheck.jsp" method="post">
     <input type="text" name="Id" placeholder="아이디"><br/>
     <input type="password" name="Pw" placeholder="비밀번호"><br/>
     <input type="text" name="u_name" placeholder="이름"><br/>
     <input type="text" name="u_email" placeholder="이메일"><br/>
     <button type="submit" class="btn btn-warning">회원가입하기</button>
     </form>
</body>
</html>