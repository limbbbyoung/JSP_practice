<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 로그인했는지 여부 확인(세션)
    String userId = (String)session.getAttribute("s_user_id");
    // 로그인 안했다면 redirect로 로그인창으로 보내기
    if(userId == null){
	 response.sendRedirect("http://localhost:8181/JDBCPrj/user/userLoginForm.jsp");
    }
    // 로그인 된 유저라면 해당 유저의 세션에 있던 아이디를 이용해 회원탈퇴 로직 실행
    // 한 다음 발급되어있던 세션 파기(로그아웃) 까지 시킨 다음
    /* request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
    String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";  */
    session.invalidate();
	UserDAO dao = new UserDAO();
   	String delete = dao.userDelete(userId);
   	System.out.println(delete); 
    // 다시 로그인창으로 리다이렉트 해서 보내기
    // response.sendRedirect("userLoginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h1><%= userId %>님 회원탈퇴 되었습니다.</h1>
      <a href="http://localhost:8181/JDBCPrj/user/userLoginForm.jsp">로그인창으로 돌아가기</a>
</body>
</html>