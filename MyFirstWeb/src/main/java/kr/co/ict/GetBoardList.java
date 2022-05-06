package kr.co.ict;

import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class getBoardList
 */
@WebServlet("/boardList")
public class GetBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardList 접속 감지");
		String strPageNum = request.getParameter("pageNum");
		int pageNum = Integer.parseInt(strPageNum);
		BoardDAO bdao = BoardDAO.getInstance();
		List<BoardVO> boardList = bdao.getBoardList(pageNum);
		System.out.println("데이터 받아오는지 확인 : " + boardList);
		
		request.setAttribute("boardList", boardList);
	
		RequestDispatcher dp = request.getRequestDispatcher("/board/getBoardList.jsp");

		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardList 접속 감지(POST)");
		request.setCharacterEncoding("utf-8");
	    String strPageNum = request.getParameter("pageNum");
	    int pageNum = Integer.parseInt(strPageNum);
		System.out.println("/boardList 접속 감지");
		BoardDAO bdao = BoardDAO.getInstance();
		List<BoardVO> boardList = bdao.getBoardList(pageNum);
		System.out.println("데이터 받아오는지 확인 : " + boardList);
		
		request.setAttribute("boardList", boardList);
	
		RequestDispatcher dp = request.getRequestDispatcher("/board/getBoardList.jsp");

		dp.forward(request, response);
	}

}
