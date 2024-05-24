package net.donation.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;

public class DonationDetailAction implements Action { // �Խñ� �󼼺���
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		DonationDAO donationdao = new DonationDAO();

		HashMap<DonationBean, String> donationdata = new HashMap<>();
		HashMap<DonationBean, String> donationBefore = new HashMap<>();

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		int num = Integer.parseInt(request.getParameter("num")); // request�� ���۹��� num ���� num������ �־��ش�
		int numBefore = num - 1;

		donationdata = donationdao.getDetail(num); // ������ �������� select
		if (numBefore != 0) {
			donationBefore = donationdao.getBeforeDetail(numBefore, email);
		} else {
			donationBefore = null;
		}

		if (donationdata == null) {
			System.out.println("�󼼺��� ����");
			return null;
		}
		System.out.println("�󼼺��� ����");

		request.setAttribute("donationdata", donationdata);
		request.setAttribute("donationBefore", donationBefore);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // ������� ����
		forward.setPath("./donation/receipt_detail.jsp");
		return forward;

	}
}