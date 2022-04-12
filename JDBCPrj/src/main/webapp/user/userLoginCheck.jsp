<%@page import="com.ict.domain.UserDAO"%>
<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
    // userId 라는 이름으로 전달되는 데이터 받기
    String formId = request.getParameter("userId");
    String formPw = request.getParameter("userPw");	
    
    // 추후 DB에서 꺼낸 아이디와 패스워드를 저장할 변수
    String dbId = null;
    String dbPw = null;
    // DAO를 이용한 로그인 로직으로 수정해주세요.
    UserDAO dao = UserDAO.getInstance();
    UserVO user = dao.getUserInfo(formId);
    dbId = user.getUserId();
    dbPw = user.getUserPw();
    // URL 저장
    String Url = null;
    if(dbId != null){
		  if(formPw.equals(dbPw)){
			session.setAttribute("s_user_id", formId);	
		  	Url="http://localhost:8181/JDBCPrj/user/loginWelcome.jsp";
		  } else {
			  Url="http://localhost:8181/JDBCPrj/user/userPwFail.jsp";
		     }
    } else {
    	Url="http://localhost:8181/JDBCPrj/user/userIdFail.jsp";
    }		
    response.sendRedirect(Url);
%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<style>
    body { width : 500px; 
           margin : 10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>