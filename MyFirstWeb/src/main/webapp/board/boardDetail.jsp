<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>${board.boardNum }번 글 조회결과입니다.</h1>
    제목 : <input type="text" value="${board.title }"><br/> 조회수 ${board.hit }
    <textarea placeholder="readonly" cols="40" rows="10">${board.content }</textarea><br/>
    글쓴이 : <input type="text" value="${board.writer }" readonly><br/>
    쓴 날짜 : ${board.bDate }<br/>
    마지막 수정날짜 : ${board.mDate }<hr/>
    <a href="http://localhost:8181/MyFirstWeb/boardList.do" ><button>글 목록 돌아오기</button></a>
    <br/>
    <c:if test="${sessionScope.s_user_id eq board.writer }">
    <form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
    <input type="hidden" name="boardNum" value="${board.boardNum }">
    <input type="hidden" name="boardWriter" value="${board.writer }">
    <button type="submit">글 수정하기</button>
    </form>
    
    <form action="http://localhost:8181/MyFirstWeb/boardDelete.do" method="post">
    <input type="hidden" name="boardNum" value="${board.boardNum }">
    <input type="hidden" name="boardWriter" value="${board.writer }">
    <button type="submit">삭제</button>
    </form>
    </c:if>
</body>
</html>