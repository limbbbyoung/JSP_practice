package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import kr.co.ict.domain.BoardDAO;

public class BoardUpdateService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 업데이트 로직 수행
		// POST방식이기 때문에 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 세션에 있는 아이디 추출
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("s_user_id");
		String boardWriter = request.getParameter("boardWriter");
		if(sId == null && sId.equals(boardWriter)){
		BoardDAO dao = BoardDAO.getInstance();
		String content = request.getParameter("content");
		String strBoardNum = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(strBoardNum);
	    dao.boardUpdate(content, boardNum);
	   } else {
		   
	   }
	}
}
