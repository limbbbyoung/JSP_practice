<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 과제 : 
    // 아이디 "abcd1234", 비번 "1111"이 확인되는 경우만 session_id 세션명으로 세션을 발급해주세요.
    // 저장데이터는 로그인한 아이디입니다.
    

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