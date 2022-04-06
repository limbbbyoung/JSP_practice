<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
    // userId 라는 이름으로 전달되는 데이터 받기
    String formId = request.getParameter("userId");
    String formPw = request.getParameter("userPw");
    
	ResultSet rs = null;	
	// ResultSet의 데이터를 자바 클래스로 교체할 수 있도록 UserVO를 생성
	UserVO user = new UserVO();
	
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
		    String sql = "SELECT * FROM userinfo WHERE user_id=?";
		     
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, formId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){// 메모리회수를 위해 바로 조회
			// 생성된 UserVO에 Setter를 이용해 변수명에 맞는 자료 입력
			user.setUserId(rs.getString(1));
			user.setUserPw(rs.getString(2));
			user.setUserName(rs.getString(3));
			user.setEmail(rs.getString(4));
			
			System.out.println("UserVO 내부 자료 조회");
			System.out.println(user.getUserId());
			System.out.println(user.getUserPw());
			System.out.println(user.getUserName());
			System.out.println(user.getEmail());
			System.out.println("------------------");
			} else {
				response.sendRedirect("http://localhost:8181/JDBCPrj/user/userIdFail.jsp");
			}
			rs.close(); // ResultSet, Connection, PreparedStatement는 .close()로 닫을수있음.
		} catch(Exception e) {
			e.printStackTrace();
		}  
		// UserVO의 getter를 이용해 비밀번호를 얻어옴
		String dbPw;
		dbPw = user.getUserPw();
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
     <%
   		 if(dbPw.equals(formPw)){
   			 session.setAttribute("s_user_id", formId);
   			 response.sendRedirect("http://localhost:8181/JDBCPrj/user/loginWelcome.jsp");
   		 } else{
   			 response.sendRedirect("http://localhost:8181/JDBCPrj/user/userPwFail.jsp");
   		 }
     %>
</body>
</html>