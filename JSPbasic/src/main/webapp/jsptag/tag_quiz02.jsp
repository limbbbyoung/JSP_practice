<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
</style>
<script>
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int total = 1; 
%>
<%  total++; 
    int rn = (int)(Math.random() * 8 + 2);
%>
     <p>
     페이지 누적 요청수 : <%= total %><br/>
     매 <b>10</b>번째 방문자에게는 기프티콘을 드립니다.<br/>
     <% if(total % 10 == 0){ %>
          당첨되셨습니다.
     <% } %>
     </p>
     <p>
     <br/>
     <hr/>
     <h2>랜덤 구구단(<%= rn %>)</h2>
     이번에 나온 구구단은 <%= rn %> 단입니다.<br/>
     <% for(int i = 1; i < 10; i++){ %> 
    	 <%= rn %> X <%= i %> = <%= rn * i %> <br/>
     <% } %>
     </p>
</body>
</html>