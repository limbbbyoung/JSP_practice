<%@page import="kr.co.ict.domain.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ict.domain.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 포워딩으로 먼저 넘어온 다음 리다이렉트를 이어서 실행하도록 해야 
포워딩/리다이렉트 호출이 겹쳐서 에러가 나는걸 막을 수 있으므로
이 경우만 예외적으로 스크립트릿을 이용한 리다이렉트를 사용합니다. -->
세션값 : ${sessionScope.s_user_id }<br/>
<c:if test="${sessionScope.s_user_id eq null }">
 <!-- <script>location.href="http://localhost:8181/MyFirstWeb/"</script>
      스크립트릿을 정말로 쓰고 싶지 않을때 사용, 하지만 단점이 있음. 웹페이지에서 조작가능  -->
<% //response.sendRedirect("http://localhost:8181/MyFirstWeb/"); %>
</c:if>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<head>
<style>
	a {
	     color : black;
	     text-decoration-line : none;
	  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ${boardList } -->
    <h1>/boardList 임시 페이지</h1>
    <table class="table table-primary table-hover">
       <thead>
           <tr>
              <th>글번호</th>
              <th>글제목</th>
              <th>글쓴이</th>
              <th>쓴날짜</th>
              <th>수정날짜</th>
              <th>조회수</th>
           </tr>
       </thead>
       <!-- JSTL c:forEach와 ${boardList}를 활용하면 됩니다.
       전체 글 정보를 테이블 형식으로 보내주세요. -->
       <tbody>
         <c:forEach var="board" items="${boardList }">
	          <tr>
	             <td>${board.boardNum}</td>
	             <td><a href="/MyFirstWeb/boardDetail.do?board_num=${board.boardNum}">${board.title}</a></td>
	             <td>${board.writer}</td>
	             <td>${board.bDate}</td>
	             <td>${board.mDate}</td>
	             <td>${board.hit}</td>
	          </tr>
        </c:forEach>
       </tbody>
    </table>
    ${buttons }<br/>
    
    <!-- foreach문의 start, end속성을 이용해 숫자를 알맞게 깔아주세요. -->
    <nav aria-label="Page navigation example">
		  <ul class="pagination">
		  <!-- 이전 10개 페이지 조회버튼을 출력합니다.
          현재 조회중인 페이지가 1~10 페이지가 아닐때만, 첫페이지 -1을 목표주소로 해서 prev 버튼을 만들면 됩니다. -->
          <c:if test="${buttons.startPage ne 1}">
		    <li class="page-item"><a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.startPage-1 }">Previous</a></li>
		  </c:if>
    <c:forEach var="pageNum" begin="${buttons.startPage }" end="${buttons.endPage }"> 
		    <li class="page-item"><a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageNum}">${pageNum }</a></li>
    </c:forEach> 
          <c:if test="${buttons.endPage ne buttons.totalPages}">
		    <li class="page-item"><a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.endPage+1 }">Next</a></li>
		  </c:if>
		  </ul>
	</nav>
    <c:if test="${sessionScope.s_user_id eq null }"><a href="http://localhost:8181/MyFirstWeb/boardInsertForm.do" ><button>글 쓰기</button></a></c:if>
</body>
</html>