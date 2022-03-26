<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%-- 아래에 폼을 만들어주세요.
    목적지는 함께 만든 req_photo_result.jsp
    테이블을 이용해 사진 제목, 체크박스를 만들어주세요.
    그리고 아래에 제출 버튼은 "그림 보러 가기"로 적어주시고
    해당 버튼을 눌렀을때 req_photo_result에 어떤 그림을 선택했는지
    체크박스로 구분해주시고, 구분한 그림에 맞는 사진이 결과페이지에 나오도록
    if~else문을 구성해주세요.
    그림파일은 <img src="그림파일명">을 이용해 출력가능합니다. --%>
     <form action="http://localhost:8181/JSPbasic/jspobject/request/req_photo_result.jsp" method="post">
     <h1>그림 선택하기</h1> 
     <hr/>                                                                                                   
      <table class="table table-border table-hover table-warning">
       <tr>
         <th>사진 설명</th>
         <th>선택</th>
       </tr>
       <tr> 
         <td>분위기있고 아름다운 여성의 사진입니다.</td>
         <td><input type="radio" name="photo" value="1번그림">1번 그림 &nbsp;</td>
       </tr>
       <tr> 
         <td>강가에 소파가 있는 사진입니다.</td>
         <td><input type="radio" name="photo" value="2번그림">2번 그림 &nbsp;</td>
       </tr>
    </table>
    <input type="submit" class="btn btn-danger" value="그림 보러 가기"> 
    </form>
</body>
</html>