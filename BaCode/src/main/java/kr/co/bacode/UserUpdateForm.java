package kr.co.bacode;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bacode.domain.userDAO;
import kr.co.bacode.domain.userVO;



/**
 * Servlet implementation class UserUpdateForm
 */
@WebServlet("/userUpdateForm")
public class UserUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uId = request.getParameter("uId");
		userDAO dao = userDAO.getInstance();
		userVO user  = dao.getUserDetail(uId);
		request.setAttribute("user", user);
		RequestDispatcher dp = request.getRequestDispatcher("/user/userUpdateForm.jsp");
		dp.forward(request, response);
	}

}
