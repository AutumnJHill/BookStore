package com.e2.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e2.user.model.service.MemberService;

/**
 * Servlet implementation class UserDeleteController
 */

//유저 회원탈퇴 Controller - 
@WebServlet("/userDelete.member")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String deletePwd = request.getParameter("deletePwd");
		
		int result = new MemberService().userDelete(deletePwd,userId);
		if(result>0) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath());			
		}else {
			request.setAttribute("msg", "회원삭제에 실패하셨습니다.");
			request.getRequestDispatcher("/view/mypage/MY_0020.jsp").forward(request, response);
		}
		
	}

}
