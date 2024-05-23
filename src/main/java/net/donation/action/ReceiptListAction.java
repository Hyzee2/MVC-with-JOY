package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;
import net.user.db.UserBean;
import net.user.db.UserDAO;

import java.util.*;

public class ReceiptListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		if (email != null) { // �α����� �Ǿ����� ���, 

			DonationDAO donationdao = new DonationDAO(); // db ����

			UserBean userdata = new UserBean();
			userdata.setEmail(email);
			
			int user_id = donationdao.getId(userdata);
			
			List<DonationBean> donationlist = new ArrayList<>();
			donationlist = donationdao.getDonationList(user_id);

			request.setAttribute("donationlist", donationlist);
		
			UserDAO userdao = new UserDAO(); // db����
			
			String username = userdao.getName(email);
			
			request.setAttribute("username", username);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/receipt_list.jsp"); // ��α� ������ ����Ʈ �����ִ� ȭ������ �̵� 
			return forward;
			
		} else { // �α����� �ȵǾ����� ���, 
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./ReceiptLogin.do"); // ��α� �α��� �ϵ��� �̵� 
			return forward;
		}

	}

}
