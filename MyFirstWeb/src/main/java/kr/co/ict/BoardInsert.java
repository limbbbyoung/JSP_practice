package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class boardInsert
 */
@WebServlet("/boardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("/boardInsert 접속 감지");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// DAO를 생성하세요.
		BoardDAO dao = BoardDAO.getInstance();
		// DAO를 통해 INSERT 구문 실행
	    String insertBoard = dao.boardInsert(writer, title, content);
	    // 리스트로 리다이렉트(서블릿 주소로 
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do");
	}

}
