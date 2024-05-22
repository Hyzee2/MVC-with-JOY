package net.donation.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class NoticeFrontController
 */
@WebServlet("*.do")
public class DonationFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DonationFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String RequestURI = request.getRequestURI(); // 전체 URL 불러오기
		String contextPath = request.getContextPath(); // URL 중 MVC까지 불러오기(MVC는 웹 프로젝트 명)
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null; // 포워드로 할지, 리다이랙션으로 보낼지 결정하는 클래스 변수
		Action action = null; // 인터페이스 Action으로 동적바인딩을 사용함

		if (command.equals("/DonationList.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/donation_view.jsp");
		}else if (command.equals("/DonationForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/donation_form.jsp");
		}else if (command.equals("/ReceiptList.do")) { // 기부금영수증 리스트 불러오기 전에 로그인 여부 확인
			action = new ReceiptListAction(); // 로그인 상태: 기부금영수증 리스트 보여주기 포워드, 로그아웃 상태: 기부금영수증 로그인 화면으로 리다이렉트
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ReceiptLogin.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/receipt_login.jsp");
		}
		
		

		if (forward.isRedirect()) { // forward라는 변수 안에 isRedirect가 담겨있으므로 true이면 redirect방식, false이면 forward 방식
			response.sendRedirect(forward.getPath()); // url변경. 이전페이지가 갖고있던 권한은 사라짐
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
			dispatcher.forward(request, response); // forward 사용하면 포워드 방식으로 이동 가능
			// url 변경없이. 이전페이지가 갖고있던 권한 그대로 승계
		}
	}

}
