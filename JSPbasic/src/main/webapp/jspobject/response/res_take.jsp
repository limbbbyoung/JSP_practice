<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String strAge = request.getParameter("age");
	System.out.println(strAge); // 콘솔에서 확인
	out.println(strAge); // 브라우저에서 확인
	
	// 대소비교를 하기 위해 정수로 바꿔줍니다.
	int age = Integer.parseInt(strAge); // 숫자로 이루어진 문자를 정수로 변환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   if(age >= 20){
	   out.println("성인입니다.");
	   response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/response/res_adult.jsp");
   } else {
	   out.println("미성년자입니다.");
	   response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/response/res_kids.jsp");
   }
%>

</body>
</html>