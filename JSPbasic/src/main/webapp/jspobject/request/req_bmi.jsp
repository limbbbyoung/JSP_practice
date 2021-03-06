<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
    * 폼에서 보내는 데이터 받기
    1. #으로 했던 form의 목적지를 req_bmi.jsp로 해주세요 (서버 실행 후 브라우저창 주소 복붙하면 됨)
    2. 스크립트릿을 이용해 req_bmi_form.jsp에서 보내는 데이터를 받아 자바 데이터로 저장해주세요. 
    3. 받아온 값을 화면에 출력해주세요.
    
       bmi지수 계산 공식 [체중(kg) / 신장(m) * 신장(m)]
    * bmi지수가 23을 초과한다면 "당신은 과제중입니다."를 출력
    18.5 미만이라면 "당신은 저체중입니다."를 출력,
    나머지는 "당신은 정상체중입니다."를 출력하세요.
    --%>
    <% 
    request.setCharacterEncoding("utf-8");
    String a = request.getParameter("cm");
    String b = request.getParameter("kg");
    Double A = (Double.parseDouble(a) / 100);
    Double B = Double.parseDouble(b);
    Double bmiNum = ( B / (A*A));
    if(bmiNum > 23){
    	out.println("당신은 과체중입니다.<br/>");
    } else if(bmiNum < 18.5){
    	out.println("당신은 저체중입니다.<br/>");
    } else { 
    	out.println("당신은 정상체중입니다.<br/>");
    }
    %>
    키 : <%= a %><br/>
    체중 : <%= b %><br/>
    BMI : <%= bmiNum %><br/>
    <hr>
    <%-- 조건문을 이용한 출력(태그내 문자 활용) --%>
    <% if(bmiNum > 23){ %>
    당신은 과체중입니다.<br/>
    <% } else if(bmiNum < 18.5){ %>
    당신은 저체중입니다.<br/>
    <% } else { %>
    당신은 정상체중입니다.
    <% } %>
</body>
</html>