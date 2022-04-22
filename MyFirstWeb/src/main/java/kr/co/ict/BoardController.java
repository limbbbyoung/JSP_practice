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
			System.out.println("/boardList 접속 감지");
			List<BoardVO> boardList = dao.getBoardList();
			System.out.println("데이터 받아오는지 확인 : " + boardList);
			request.setAttribute("boardList", boardList);
			ui = "/board/getBoardList.jsp";
		}
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}

}
