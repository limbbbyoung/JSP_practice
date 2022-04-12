<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스크립트릿을 이용해
el_obj.jsp의 폼에서 날려준 데이터를 받아 
body태그 내에 표현식을 < %= %> 을 이용해
표출해주세요. -->
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String nick = request.getParameter("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%-- 이름 : <%= name %><br/>
           별명 : <%= nick %> --%> 
      
      <%-- request.getParameter("이름");
      el 내부에서는 $("request.명칭) --%>
      이름 : ${param.name }<br/>
      별명 : ${param.nick }<br/>
      <hr/>
      ${requestScope }
</body>
</html>