<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
     // int randomNumber() 메서드를 선언해주세요.
     // 정수 1 ~ 10까지의 난수를 발생시켜 리턴해줍니다.
     int randomNumber(){
	  return (int)(Math.random() * 10 + 1);
     }

     String randomColor(){
    	  // 난수를 발생시켜서 약 33% 확률로 "빨강"
    	  // 약 33% 확률로 "노랑"
    	  // 약 33% "파랑" 을 리턴하는 메서드를 선언해주세요.
    	  String red = "빨강";
    	  String yellow = "노랑";
    	  String blue = "파랑";
    	  int rn = (int)(Math.random() * 3 + 1);
    	  if(rn == 1){
    		 return red;
    	  } else if(rn == 2){
    		  return yellow;
    	  } else { 
    		  return blue;
    	  }
     }
     
     // 선언부(Declaration)에 선언한 변수는 딱 한 번만 실행되는 static 속성을 가지게 됩니다.
     int total = 0;
%>
<%
     // 스크립트릿에 선언한 변수는 새로고침 할 때 마다 새롭게 선언됩니다.
     int each = 0;
     total++;
     each++;
%>
		<h2>오늘의 행운의 숫자와 행운의 색깔</h2>
		행운의 숫자 : <%= randomNumber() %><br/>
		행운의 색깔 : <%= randomColor() %><br/>
		누적 요청수 : <%= total %><br/>
		개별 요청수 : <%= each %><br/>
</body>
</html>