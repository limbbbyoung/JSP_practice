package kr.co.bacode;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bacode.domain.userDAO;

/**
 * Servlet implementation class UserUpdate
 */
@WebServlet("/userUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		String uName = request.getParameter("uName");
		String addr = request.getParameter("addr");
		String pNum = request.getParameter("pNum");
		String nckName = request.getParameter("nckName");
		String email = request.getParameter("email");

		
		System.out.println("uid : " + uId + " upw :" + uPw + " 이름 " + uName + " 주소 : " + addr + " 전화번호 : " + pNum + "닉네임 : " + nckName + " 이메일 : " + email);
		userDAO dao = userDAO.getInstance();
		
		dao.userUpdate(uId, uPw, uName, email, pNum, addr, nckName);
		response.sendRedirect("http://localhost:8181/BaCode/getUserDetail?uId=" + uId );
	}

}
