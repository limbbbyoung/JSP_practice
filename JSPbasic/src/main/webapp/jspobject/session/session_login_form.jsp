<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 이미 로그인한 사람이 로그인 페이지를 들어올 수도 없게 해야 합니다.
    // 로그인한 사람이 들어오는 경우, session_login_ok.jsp로 보내주세요.
    String userId = (String)session.getAttribute("s_id");
    if(userId != null){
    	String nowuId = request.getParameter("id");
    if(nowuId == userId){
    	response.sendRedirect("session_login_ok.jsp");
      }
    }  
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <form action="http://localhost:8181/JSPbasic/jspobject/session/session_login_check.jsp" method="post">
     <input type="text" name="id" placeholder="아이디"><br/>
     <input type="password" name="pw" placeholder="비밀번호"><br/>
     <input type="submit" value="login">     
     </form>
</body>
</html>