<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>${board.boardNum }번 글 조회결과입니다.</h1>
    제목 : <input type="text" value="${board.title }"><br/>
    <textarea placeholder="readonly" cols="40" rows="10">${board.content }</textarea><br/>
    글쓴이 : <input type="text" value="${board.writer }"><br/>
    쓴 날짜 : ${board.bDate }<br/>
    마지막 수정날짜 : ${board.mDate }<hr/>
    
    <form action="http://localhost:8181/MyFirstWeb/boardDelete" method="post">
    <input type="hidden" name="boardNum" value="${board.boardNum }">
    <button type="submit">삭제</button>
    </form>
    <br/>
    <a href="http://localhost:8181/MyFirstWeb/boardList" ><button>글 목록 돌아오기</button></a>
    <br/><br/>
    <form action="http://localhost:8181/MyFirstWeb/boardUpdateForm" method="post">
    <input type="hidden" name="boardNum" value="${board.boardNum }">
    <button type="submit">글 수정하기</button>
    </form>
</body>
</html>