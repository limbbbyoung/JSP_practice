package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.domain.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 삭제 로직을 수행하는 소스코드
		// POST방식이기 때문에 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 세션에 있는 아이디 추출
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("s_user_id");
		// 아이디가 일치하는 경우만 아래의 delete로직이 호출되도록 조건문으로 감싸주세요.
		String boardWriter = request.getParameter("boardWriter");
		if(sId != null && sId.equals(boardWriter)) {
			BoardDAO dao = BoardDAO.getInstance();
			String strboardNum = request.getParameter("boardNum");
			int boardNum = Integer.parseInt(strboardNum);
		    dao.boardDelete(boardNum);
	}

  }
	
}
