<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String musicPick = request.getParameter("music");
if(musicPick.equals("1번음악")){
	response.sendRedirect("https://www.youtube.com/watch?v=R7L2QEm-BUY");
} else if(musicPick.equals("2번음악")){
	response.sendRedirect("https://www.youtube.com/watch?v=FAunoA-6qHw");
} else { 
	response.sendRedirect("https://www.youtube.com/watch?v=8q5reaEX0tY");
}

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