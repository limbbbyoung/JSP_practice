package kr.co.ict;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class getBoardDetail
 */
@WebServlet("/boardDetail")
public class GetBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardDetail 접속 감지");
		// 파라미터로 글번호("boardNum")을 받아오세요.
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		System.out.println("조회예정인 글번호 : " + boardNum);
		// DAO를 생성하세요.
		BoardDAO bdao = BoardDAO.getInstance();
		// DAO에서 호출한 디테일 글 정보를 저장해주세요.
		BoardVO getboard = bdao.getBoardDetail(boardNum);
		// 바인딩해주세요.
		request.setAttribute("board", getboard);
	    // 포워딩해주세요.
		RequestDispatcher dp = request.getRequestDispatcher("/board/boardDetail.jsp");
		
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardDetail 접속 감지");
		// 파라미터로 글번호("boardNum")을 받아오세요.
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		System.out.println("조회예정인 글번호 : " + boardNum);
		// DAO를 생성하세요.
		BoardDAO bdao = BoardDAO.getInstance();
		// DAO에서 호출한 디테일 글 정보를 저장해주세요.
		BoardVO getboard = bdao.getBoardDetail(boardNum);
		// 바인딩해주세요.
		request.setAttribute("board", getboard);
	    // 포워딩해주세요.
		RequestDispatcher dp = request.getRequestDispatcher("/board/boardDetail.jsp");
		
		dp.forward(request, response);
	}

}
