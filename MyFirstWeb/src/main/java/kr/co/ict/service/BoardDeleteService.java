package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 삭제 로직을 수행하는 소스코드
		BoardDAO dao = BoardDAO.getInstance();
		String strboardNum = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(strboardNum);
	    dao.boardDelete(boardNum);
	}

}
