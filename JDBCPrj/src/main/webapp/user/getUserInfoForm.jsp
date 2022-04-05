<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<style>
    body { margin : 10px;
          }
    button { margin : 10px;
           }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>회원 정보 불러오기</h1>
     <form action="http://localhost:8181/JDBCPrj/user/getUserInfo.jsp" method="post">
     <input type="text" name="userId" placeholder="아이디"><br/>
     <button type="submit" class="btn btn-info">확인</button>
     </form>
</body>
</html>