<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	System.out.println(userId);
	System.out.println(userPw);
	
	// 세션 로그인처리
	// 세션 로그인처리는 쿠키 로그인 처리와는 달리 모든 세션목록을 반복문을 뒤질 필요가 없어서 효율적입니다.
	// 아이디 : "abcd1234", 비밀번호 : "1111"
	// 위 고정 문자열을 아이디, 비밀번호로 사용하여
	if(userId.equals("abcd1234")){
		if(userPw.equals("1111")){
			session.setAttribute("s_id", userId);
			response.sendRedirect("session_login_ok.jsp");
		} else {
			response.sendRedirect("session_pw_fail.jsp"); 
		}
	} else { 
		response.sendRedirect("session_id_fail.jsp");
	}
	System.out.println((String)session.getAttribute("s_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>