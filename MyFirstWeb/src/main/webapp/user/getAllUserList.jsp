<%@page import="kr.co.ict.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% 
/*
    // 스크립트릿 내부에 전체 회원정보를 가져오도록 코드를 작성해서
    // ResultSet 변수에 저장까지만 해주세요.
    String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
	// 그래서 body태그에 출력 해야하는 필수요소는 try 진입 전 선언해놓아야함
	ResultSet rs = null;	
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
		    String sql = "SELECT * FROM userinfo";
		     
			PreparedStatement pstmt = con.prepareStatement(sql);
			 
			rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
		*/
		// 바로 위에 원래 작성된 접속 로직 저장되어있음.
		UserDAO dao = UserDAO.getInstance();// 생성과 동시에 Class.forName(디비타입)까지 호출
		List<UserVO> userList = dao.getAllUserList();// DB연결해 전체 목록 가져다 주고 종료.
		out.println("DAO에서 전달 받은 자료 : " + userList);
%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<style>
 body { margin : 10px;
        width : 500px;
      ]
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
       // ResultSet에 든 정보를 여기에 out.println()이나
       // 표현식 <%= % > 을 이용해 출력시도를 해보세요
       /* while(rs.next()){
    	    out.println(rs.getString(1) + "<br/>");
		    out.println(rs.getString(2) + "<br/>");
		    out.println(rs.getString(3) + "<br/>");
		    out.println(rs.getString(4) + "<br/>");
		    out.println("------------------------");
       } */
    %>
    <h1>현재 DB자료</h1>
<table border="2" class="table table-primary table-hover">
   <thead>
       <tr>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>이름</th>
          <th>이메일</th>
       </tr>
   </thead>
   <tbody>
        <% for(UserVO user : userList){ %>
          <tr>
             <td><%= user.getUserId() %></td>
             <td><%= user.getUserPw() %></td>
             <td><%= user.getUserName() %></td>
             <td><%= user.getEmail() %></td>
          </tr>
        <% } %>
   </tbody>
</table>
</body>
</html>