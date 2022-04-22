package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("/boardUpdate 접속 감지");
		String content = request.getParameter("content");
		String strBoardNum = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(strBoardNum);
		System.out.println("내용 : " + content);
		System.out.println("게시글 번호 : " + boardNum);
		// 싱글턴 패턴으로 DAO생성해서 가져오기
		BoardDAO dao = BoardDAO.getInstance(); 
		// DAO를 통해 UPDATE구문 실행
	    dao.boardUpdate(content, boardNum);
	    // 리스트로 리다이렉트
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardDetail?board_num=" + boardNum);
		
		/*.setAttribute("boardNum", boardNum);
		
        RequestDispatcher dp = request.getRequestDispatcher("/board/boardDetail.jsp");
		
		dp.forward(request, response);*/
	}

}
