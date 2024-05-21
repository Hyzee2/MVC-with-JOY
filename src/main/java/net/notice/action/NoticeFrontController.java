package net.notice.action;

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
@WebServlet("*.no")
public class NoticeFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeFrontController() {
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
		String RequestURI = request.getRequestURI(); // ��ü URL �ҷ�����
		String contextPath = request.getContextPath(); // URL �� MVC���� �ҷ�����(MVC�� �� ������Ʈ ��)
		String command = RequestURI.substring(contextPath.length()); // URL �߶󳻰� BoardList.bo �κи� ����

		ActionForward forward = null; // ������� ����, �����̷������� ������ �����ϴ� Ŭ���� ����
		Action action = null; // �������̽� Action���� �������ε��� �����

		if (command.equals("/NoticeAddAction.no")) {
			action = new NoticeAddAction(); // Action�� �������̽��ϴ� BoardListAction ��ü ����. �������ε� �����ϸ� BoardListAction action
											// = new BoardListAction();
			try {
				forward = action.execute(request, response); // action�� forward�� ����ְ�, �� �Ʒ��ʿ��� ���۹�İ� ��ο� �°� ����ȴ�.
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeList.no")) {
			action = new NoticeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeDetailAction.no")) {
			action = new NoticeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		

		if (forward.isRedirect()) { // forward��� ���� �ȿ� isRedirect�� ��������Ƿ� true�̸� redirect���, false�̸� forward ���
			response.sendRedirect(forward.getPath()); // url����. ������������ �����ִ� ������ �����
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // RequestDispatcher��� ����
																							// �����
			dispatcher.forward(request, response); // forward ����ϸ� ������ ������� �̵� ����
			// url �������. ������������ �����ִ� ���� �״�� �°�
		}
	}

}
