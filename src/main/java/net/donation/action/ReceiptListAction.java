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
		
		if (email != null) { // 로그인이 되어있을 경우, 

			DonationDAO donationdao = new DonationDAO(); // db 연결

			UserBean userdata = new UserBean();
			userdata.setEmail(email);
			
			int user_id = donationdao.getId(userdata);
			
			List<DonationBean> donationlist = new ArrayList<>();
			donationlist = donationdao.getDonationList(user_id);

			request.setAttribute("donationlist", donationlist);
		
			UserDAO userdao = new UserDAO(); // db연결
			
			String username = userdao.getName(email);
			
			request.setAttribute("username", username);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/receipt_list.jsp"); // 기부금 영수증 리스트 보여주는 화면으로 이동 
			return forward;
			
		} else { // 로그인이 안되어있을 경우, 
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./ReceiptLogin.do"); // 기부금 로그인 하도록 이동 
			return forward;
		}

	}

}
