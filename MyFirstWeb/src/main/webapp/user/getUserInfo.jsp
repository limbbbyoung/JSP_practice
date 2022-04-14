<%@page import="kr.co.ict.domain.UserVO"%>
<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면
	String userId = request.getParameter("userId");
    request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
   
    // - DAO생성(MySQL을 쓴다고 지정)
    UserDAO dao = UserDAO.getInstance();
    // - DAO 내부 메서드인 .getUserInfo(유저명) 호출
    UserVO user = dao.getUserInfo(userId);
    System.out.println("유저 정보 확인 : " + user);
    out.println(user);
    
    /* String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
    // 1. userId 라는 이름으로 전달되는 데이터를 받으면
    String userId = request.getParameter("userId");
    // 2. DB연동후
    // 3. 해당 아이디의 정보만 ResultSet에 받아와서
	
	ResultSet rs = null;	
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
		    String sql = "SELECT * FROM userinfo WHERE user_id=?";
		     
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		} */
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
       <h1><%= userId %> 유저의 정보입니다</h1>
    <table border="3" class="table table-warning table-hover table-bordered">
        <thead>
            <tr>
               <th>아이디</th>
               <th>비밀번호</th>
               <th>이름</th>
               <th>이메일</th>
            </tr>
        </thead>
        <tbody>
            <tr> 
               <td><%= user.getUserId() %></td>
               <td><%= user.getUserPw() %></td>
               <td><%= user.getUserName() %></td>
               <td><%= user.getEmail() %></td>
            </tr>
        </tbody>
    </table>        
</body>
</html>