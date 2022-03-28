<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
  body { width : 800px;
         padding : 20px; }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="music_result.jsp" method="post">
    <table class="table table-bordered table-hover table-primary">
    <thead>
        <tr>
          <th>가수</th>
          <th>노래제목</th>
          <th>노래선택</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <td>PATEKO</td>
          <td>Rainy day</td>
          <td><input type="radio" name="music" value="1번음악"></td>
        </tr>
        <tr>
          <td>재하</td>
          <td>끝이라고 말하지마</td>
          <td><input type="radio" name="music" value="2번음악"></td>
        </tr>
        <tr>
          <td>벤</td>
          <td>갈 수가 없어</td>
          <td><input type="radio" name="music" value="3번음악"></td>
        </tr>
    </tbody>
    </table>
    <input type="submit" class="btn btn-danger" value="음악 들으러 가기"> 
    </form>
</body>
</html>