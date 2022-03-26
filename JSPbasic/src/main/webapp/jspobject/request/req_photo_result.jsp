<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
     request.setCharacterEncoding("utf-8");
     String photoPick = request.getParameter("photo");
%>
<!DOCTYPE html>
<html>
<head>
<style>
     
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택한 그림 : <%=photoPick%><br/>  
<%
    if(photoPick.equals("1번그림")){
    	out.println("<img height=700px width=500px src='../request/01.jpg'>");
    	out.println("1번 그림을 선택하셨네요!");
    } else {
    	out.println("<img height=700px width=500px src='../request/02.png'>");
    	out.println("2번 그림을 선택하셨네요!");
    }


%>                  
</body>
</html>