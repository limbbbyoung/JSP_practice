package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/boardDelete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("/boardDelete 접속 감지");
		String strboardNum = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(strboardNum);
		System.out.println(boardNum);
		// DAO를 생성하세요.
		BoardDAO dao = BoardDAO.getInstance();
		// DAO를 통해 DELETE 구문 실행
	    dao.boardDelete(boardNum);
	    response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList");
	}
}
