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
import kr.co.ict.service.BoardDetailService;
import kr.co.ict.service.BoardInsertService;
import kr.co.ict.service.BoardListService;
import kr.co.ict.service.IBoardService;

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
		// 어떤 종류의 서비스라도 다 받을 수 있는 서비스 인터페이스 생성
		IBoardService sv = null;
		
		if(uri.equals("/MyFirstWeb/boardList.do")) {
			// 서비스 생성
			sv = new BoardListService();
			// 서비스의 .excute(request, response) 호출
			sv.execute(request, response);
			// 포워딩 주소 입력
			ui = "/board/getBoardList.jsp";
		} else if(uri.equals("/MyFirstWeb/boardDetail.do")) {
			// Detail 관련
			sv = new BoardDetailService();
			sv.execute(request, response);
		    ui = "/board/boardDetail.jsp";
		} else if(uri.equals("/MyFirstWeb/boardInsertForm.do")) {
			// 글쓰기 페이지로 넘어감
			ui = "/board/boardInsertForm.jsp";
		} else if(uri.equals("/MyFirstWeb/boardInsert.do")) {
			// 글쓰기
			sv = new BoardInsertService();
			sv.execute(request, response);
			ui = "/boardList.do"; // 리다이렉트시는 폴더명 없이 주소만 적습니다.
		} else if(uri.equals("/MyFirstWeb/boardDelete.do")) {
			// 삭제 로직을 수행하는 소스코드
			String strboardNum = request.getParameter("boardNum");
			int boardNum = Integer.parseInt(strboardNum);
		    dao.boardDelete(boardNum);
		    ui = "/MyFirstWeb/boardList";
		} else if(uri.equals("/MyFirstWeb/boardUpdateForm.do")) {
			// 업데이트 페이지로 넘어감.
			String strBoardNum = request.getParameter("boardNum");
			int boardNum = Integer.parseInt(strBoardNum);
			BoardVO board = dao.getBoardDetail(boardNum);
			request.setAttribute("board", board);
			ui = "/board/boardUpdateForm.jsp";
		} else if(uri.equals("/MyFirstWeb/boardUpdate.do")){
			// 업데이트 로직을 수행하는 소스코드
			String content = request.getParameter("content");
			String strBoardNum = request.getParameter("boardNum");
			int boardNum = Integer.parseInt(strBoardNum);
		    dao.boardUpdate(content, boardNum);
			ui = "/boardDetail.do?board_num=" + boardNum;
		} 
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}

}
