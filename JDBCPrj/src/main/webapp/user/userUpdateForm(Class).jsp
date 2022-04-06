<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //회원 수정페이지는
    // 비번, 이름, 이메일을 수정할 수 있는 페이지입니다.
    // 이름, 이메일은 이미 내가 가입할때 썼던 정보가 채워지게 해야합니다. 
    // 로그인 여부를 체크해서 로그인 안 한 사람은 메인으로 가게 해주시고
    // 로그인 한 사람은 아래 "아이디" 부분에 대신 실제아이디가 들어가게 해주세요.
    
    // 로그인했는지 여부 확인(세션)
    String userId = (String)session.getAttribute("s_user_id");
    // 로그인 안했다면 redirect로 로그인창으로 보내기
    if(userId == null){
	 response.sendRedirect("http://localhost:8181/JDBCPrj/user/userLoginForm.jsp");
    }
    
    // userId 유저의 정보를 ResultSet에 받아온 다음
    request.setCharacterEncoding("utf-8"); // post방식으로 form을 받을때 한글 호환
    String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
 
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
		}  
%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<style>
   body { margin : 10px;}
   input { margin : 10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <!-- form은 회원가입 양식과 똑같이 만들어주시면 됩니다.
     단, 아이디는 입력하지 않습니다. -->
     <h1><%= userId %>님의 정보를 수정합니다.</h1>
     <form action="http://localhost:8181/JDBCPrj/user/userUpdateCheck(Class).jsp" method="post">
     <% if(rs.next()){ %>
     비밀번호 : <input type="password" name="fPw"><br/>
     이름 : <input type="text" name="fName" value="<%= rs.getString("user_name") %>"><br/>
     이메일 : <input type="text" name="fEmail" value="<%= rs.getString("email") %>"><br/>
     <% } %>
     <button type="submit" class="btn btn-danger">수정하기</button>
     </form>
</body>
</html>