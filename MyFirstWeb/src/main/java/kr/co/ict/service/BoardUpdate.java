package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import kr.co.ict.domain.BoardDAO;

public class BoardUpdate implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 업데이트 로직 수행
		BoardDAO dao = BoardDAO.getInstance();
		String content = request.getParameter("content");
		String strBoardNum = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(strBoardNum);
	    dao.boardUpdate(content, boardNum);
	}

}
