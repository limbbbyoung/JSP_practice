<%@page import="java.sql.ResultSet"%>
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
    
	String update_Id = (String)session.getAttribute("s_user_id");// 아이디 받아오기
    String update_Pw = request.getParameter("fPw");
    String update_Name = request.getParameter("fName");
    String update_Email = request.getParameter("fEmail");
    ResultSet rs = null;
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
		
		// 콜랩스에 해당 수정 내용을 보여주기 위한 SELECT구문 실행
		String sql2 = "SELECT * FROM userinfo WHERE user_id=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, update_Id);
		rs=pstmt2.executeQuery();
	} catch(Exception e) {
		e.printStackTrace();
	}  
%>    
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<head>
<style>
   body { margin : 10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1><%= update_Id %>님의 정보가 수정되었습니다.</h1>
	 <p>
	  <button class="btn btn-success" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
	    <%= update_Id %>님의 정보
	  </button>
	 </p>
  <div style="min-height: 120px;">
	  <div class="collapse collapse-horizontal" id="collapseWidthExample">
	    <div class="card card-body" style="width: 300px;">
	      <% if(rs.next()){ %>
	      아이디 : <%= rs.getString("user_id") %><br/>
	      이름 : <%= rs.getString("user_name") %><br/>
	      이메일 : <%= rs.getString("email") %>
	      <% } %>
	    </div>
	  </div>
  </div>
</body>
</html>