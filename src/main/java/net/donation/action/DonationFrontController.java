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
		String RequestURI = request.getRequestURI(); // ��ü URL �ҷ�����
		String contextPath = request.getContextPath(); // URL �� MVC���� �ҷ�����(MVC�� �� ������Ʈ ��)
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null; // ������� ����, �����̷������� ������ �����ϴ� Ŭ���� ����
		Action action = null; // �������̽� Action���� �������ε��� �����

		if (command.equals("/DonationList.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/donation_view.jsp");
		}else if (command.equals("/DonationForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/donation_form.jsp");
		}else if (command.equals("/ReceiptList.do")) { // ��αݿ����� ����Ʈ �ҷ����� ���� �α��� ���� Ȯ��
			action = new ReceiptListAction(); // �α��� ����: ��αݿ����� ����Ʈ �����ֱ� ������, �α׾ƿ� ����: ��αݿ����� �α��� ȭ������ �����̷�Ʈ
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
		
		

		if (forward.isRedirect()) { // forward��� ���� �ȿ� isRedirect�� ��������Ƿ� true�̸� redirect���, false�̸� forward ���
			response.sendRedirect(forward.getPath()); // url����. ������������ �����ִ� ������ �����
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
			dispatcher.forward(request, response); // forward ����ϸ� ������ ������� �̵� ����
			// url �������. ������������ �����ִ� ���� �״�� �°�
		}
	}

}
