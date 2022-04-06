<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 로그인한 유저는 loginForm을 볼 수 없도록 만들어주세요.
    String userId = (String)session.getAttribute("s_user_id");
    if(userId != null)
    	response.sendRedirect("http://localhost:8181/JDBCPrj/user/loginWelcome.jsp");
    
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>로그인</h1>
     <form action="http://localhost:8181/JDBCPrj/user/userLoginCheck.jsp" method="post">
     <input type="text" name="userId" placeholder="아이디"><br/>
     <input type="password" name="userPw" placeholder="비밀번호"><br/>
     <button type="submit" class="btn btn-warning">로그인</button>
     </form>
     <a href="http://localhost:8181/JDBCPrj/user/userJoinForm.jsp">회원가입하기</a><br/>
     <a href="http://localhost:8181/JDBCPrj/user/userUpdateForm1.jsp">회원정보수정하기</a>
</body>
</html>