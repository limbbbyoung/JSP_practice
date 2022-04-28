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
 * Servlet implementation class BoardController
 */
@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식을 처리하는 경우도 생기므로, 인코딩 설정
		request.setCharacterEncoding("utf-8");
		// 프론트 컨트롤러는 여러 주소를 유형을 처리해야하니 uri부터 받아옵니다.
		String uri = request.getRequestURI();
		// 포워딩시 .jsp주소의 경로를 미리 저장할 변수 
		String ui = null;
		// dao 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		if(uri.equals("/MyFirstWeb/boardList.do")) {
			List<BoardVO> boardList = dao.getBoardList();
			request.setAttribute("boardList", boardList);
			ui = "/board/getBoardList.jsp";
		} else if(uri.equals("/MyFirstWeb/boardDetail.do")) {
			// Detail 관련 .do Servlet 연결
			String strBoardNum = request.getParameter("board_num");
			int boardNum = Integer.parseInt(strBoardNum);
			BoardVO getboard = dao.getBoardDetail(boardNum);
			request.setAttribute("board", getboard);
		    ui = "/board/boardDetail.jsp";
		} else if(uri.equals("/MyFirstWeb//boardInsertForm.do")) {
			// 글쓰기 페이지로 넘어감
			ui = "/board/boardInsertForm.jsp";
		} else if(uri.equals("/MyFirstWeb//boardInsert.do")) {
			// 글쓰기
			request.setCharacterEncoding("utf-8");
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
		    String insertBoard = dao.boardInsert(writer, title, content);
			response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do");
		}
		
		
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}

}
