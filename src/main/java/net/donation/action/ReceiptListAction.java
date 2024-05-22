package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;

import java.util.*;

public class ReceiptListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		if (email != null) {

			DonationDAO donationdao = new DonationDAO(); // db ¿¬°á

			List<DonationBean> donationlist = new ArrayList<>();

			donationlist = donationdao.getDonationList();

			request.setAttribute("donationlist", donationlist);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./donation/receipt_list.jsp");
			return forward;
			
		} else {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./ReceiptLogin.do");
			return forward;
		}

	}

}
