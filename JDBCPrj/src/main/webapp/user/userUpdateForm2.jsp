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
    
    String update_userId = request.getParameter("update_userId");
    session.setAttribute("update_userId", update_userId);
	ResultSet rs = null;	
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
		    String sql = "SELECT * FROM userinfo WHERE user_id=?";
		     
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, update_userId);
			
			rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}  

%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<style>
    h1 { margin : 10px;}
    body { margin : 10px;}
    input { margin : 10px;}
    button { margin : 10px;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <!-- form은 회원가입 양식과 똑같이 만들어주시면 됩니다.
     단, 아이디는 입력하지 않습니다. -->
      <h1><%= update_userId %>님의 정보수정하기</h1>
     <form action="http://localhost:8181/JDBCPrj/user/userUpdateCheck.jsp" method="post">
     <% if(rs.next()){ %>
     <input type="text" name="Up_id" value=<%= rs.getString("user_id") %> disabled><br/><!-- disabled가 아니라 readonly를 걸면 정보는 보내주되 읽기만 가능. disabled는 데이터 전달자체가 불가능 -->
     <input type="password" name="Up_pw" value=<%= rs.getString("user_pw") %>><br/>
     <input type="text" name="Up_name" value=<%= rs.getString("user_name") %>><br/>
     <input type="text" name="Up_email" value=<%= rs.getString("email") %>><br/>
     <% } %>
     <button type="submit" class="btn btn-warning">수정하기</button>
     </form>
</body>
</html>