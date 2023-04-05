package com.e2.board.controller.inquiry;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e2.board.model.service.BoardService;

/**
 * Servlet implementation class InquiryUpdateController
 */
//1대1문의 글 수정버튼 클릭시 세부내용 페이지- 
@WebServlet("/InquiryUpdate.bd")
public class InquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateController() {
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
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int result = new BoardService().InquiryUpdate(title,content,boardNo);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/InquiryGet.bd?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "InquiryDetailController 문제입니다.");
			request.getRequestDispatcher("/view/common/errorPage.jsp").forward(request, response);
		}
	}

}
