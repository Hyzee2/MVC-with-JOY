package net.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.lo")
public class LoginFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginFrontController() {
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

		if (command.equals("/Main.lo")) { // 메인 화면으로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./main/main.jsp");
		} else if (command.equals("/Signup.lo")) { // 회원가입 등록 완료 후 메인 화면으로 이동
			action = new JoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/LoginAction.lo")) { // 로그인 후 id와 pw 맞는지 확인하기
			action = new loginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/LogoutAction.lo")) {
			action = new logoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/LogoutView.lo")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./main/logout.jsp");
		}else if (command.equals("/UserList.lo")) { // 관리자의 회원 목록 조회 
			action = new userListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		if (forward.isRedirect()) { // forward라는 변수 안에 isRedirect가 담겨있으므로 true이면 redirect방식, false이면 forward 방식
			response.sendRedirect(forward.getPath()); // url변경. 이전페이지가 갖고있던 권한은 사라짐
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // RequestDispatcher라는
																							// 변수 만들기
			dispatcher.forward(request, response); // forward 사용하면 포워드 방식으로 이동 가능
			// url 변경없이. 이전페이지가 갖고있던 권한 그대로 승계
		}

	}

}
