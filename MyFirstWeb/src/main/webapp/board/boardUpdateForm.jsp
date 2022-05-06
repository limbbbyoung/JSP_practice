<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.s_user_id ne board.writer }">
   <%response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do"); %>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <!-- 디버깅을 절대로 소홀히 하면 안되고 매 단계마다 해주면서 확인을 해주고 모든 로직이 완벽하게 돌아갈때 거둬내면 되는것 -->
     ${board }
     <hr/>
     <form action="http://localhost:8181/MyFirstWeb/boardUpdate.do" method="post">
     글쓴이 : <input type="text" name="writer" value="${board.writer }" readonly><br/> 
     글제목 : <input type="text" name="title" value="${board.title }" readonly><br/>
     본문 : <textarea cols="50" rows="15" name="content">${board.content }</textarea><br/>
     <input type="hidden" name="boardNum" value="${board.boardNum }">
     <input type="submit" value="글 수정하기">
     <input type="reset" value="초기화">
     </form> 
</body>
</html>