<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%
      request.setCharacterEncoding("utf-8");
      String a = request.getParameter("uname");
      String b = request.getParameter("uid");
      String c = request.getParameter("upw");
      
      String[] hobby = request.getParameterValues("hobby"); // 체크박스는 같은 명칭으로 데이터가 여럿 넘어오므로 배열처리
      
      String bld = request.getParameter("blood");
      
      String rg = request.getParameter("region");
      %>
      이름 : <%= a %><br/>
      아이디 : <%= b %><br/>
      비밀번호 : <%= c %><br/>
      취미 : <%= Arrays.toString(hobby) %><br/><%-- 배열의 경우 Arrays.toString(출력배열)로 나열할 수 있다. --%>
      혈액형 : <%= bld %><br/>
      지역 : <%= rg %><br/>
</body>
</html>