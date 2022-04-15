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
public class getBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardList 접속 감지");
		BoardDAO bdao = BoardDAO.getInstance();
		List<BoardVO> boardList = bdao.getBoardList();
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
		
		int boardNum = request.getIntHeader("boardNum");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		long bdate = request.getDateHeader("bdate");
		long mdate = request.getDateHeader("mdate");
		int hit = request.getIntHeader("hit");
		System.out.println("boardNum 파라미터 값 : " + boardNum);
		System.out.println("title 파라미터 값 : " + title);
		System.out.println("content 파라미터 값 : " + content);
		System.out.println("writer 파라미터 값 : " + writer);
		System.out.println("bdate 파라미터 값 : " + bdate);
		System.out.println("mdate 파라미터 값 : " + mdate);
		System.out.println("hit 파라미터 값 : " + hit);
		
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("writer", writer);
		request.setAttribute("bdate", bdate);
		request.setAttribute("mdate", mdate);
		request.setAttribute("hit", hit);
		
		RequestDispatcher dp = request.getRequestDispatcher("http://localhost:8181/MyFirstWeb/board/getBoardList.jsp");

		dp.forward(request, response);
	}

}
