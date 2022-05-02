<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
//userLoginCheck.jsp에서 발급한 세션을 저장해주세요.
String userId = (String)session.getAttribute("s_user_id");
// 조회해서 null이면 userLoginForm.jsp로 보내버리고
 if(userId == null){
	 response.sendRedirect("http://localhost:8181/MyFirstWeb/user/userLoginForm.jsp");
 }
// 아이디가 존재한다면 body태그 내에 XXX님 환영합니다
// 라는 문장과 아래쪽에 userLogout.jsp로 가는 링크와 함께
// "로그아웃" 이라는 문장을 a태그를 이용해 띄워주세요.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h1><%= userId %>님 환영합니다.</h1>
      <a href="http://localhost:8181/MyFirstWeb/user/userLogout.jsp">로그아웃</a><br/>
      <a href="http://localhost:8181/MyFirstWeb/user/userDelete.jsp">회원탈퇴</a><br/>
      <a href="http://localhost:8181/MyFirstWeb/user/userUpdateForm(Class).jsp">회원정보수정하기</a><br/>
      <!-- 게시판으로 이동할 수 있는 링크 -->
      <a href="http://localhost:8181/MyFirstWeb/boardList.do">게시판 보러가기</a>
</body>
</html>