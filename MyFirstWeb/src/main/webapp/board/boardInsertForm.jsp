<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><form action="http://localhost:8181/MyFirstWeb/boardInsert" method="post">
     글쓴이 : <input type="text" name="writer" placeholder="글쓴이"><br/> 
     글제목 : <input type="text" name="title" placeholder="글제목"><br/>
     본문 : <textarea cols="50" rows="15" name="content"></textarea><br/>
     <input type="submit" value="글쓰기">
     <input type="reset" value="초기화">
     </form>  
</body>
</html>