package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*.test 패턴이 감지되었습니다.");
		// .test 왼쪽에 오는 문자를 감지하는 방법
		String uri = request.getRequestURI();
		System.out.println("감지된 패턴 : " + uri);
		// 네이버 접속
	    if(uri.equals("/MyFirstWeb/naver.test")) {
	    	response.sendRedirect("https://www.naver.com");
	    }// 다음 접속
	    else if(uri.equals("/MyFirstWeb/daum.test")) {
	    	response.sendRedirect("https://www.daum.net");
	    }// 유투브 접속
	    else if(uri.equals("/MyFirstWeb/youtube.test")) {
	    	response.sendRedirect("https://www.youtube.com");
	    }// 구글 접속
	    else if(uri.equals("/MyFirstWeb/google.test")) {
	    	response.sendRedirect("https://www.google.co.kr");
	    } else {
	    	System.out.println("일치하는 주소가 없어서 이동불가");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
