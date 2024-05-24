package net.donation.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;

public class DonationDetailAction implements Action { // 게시글 상세보기
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		DonationDAO donationdao = new DonationDAO();

		HashMap<DonationBean, String> donationdata = new HashMap<>();
		HashMap<DonationBean, String> donationBefore = new HashMap<>();

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		int num = Integer.parseInt(request.getParameter("num")); // request로 전송받은 num 값을 num변수에 넣어준다
		int numBefore = num - 1;

		donationdata = donationdao.getDetail(num); // 상세정보 가져오기 select
		if (numBefore != 0) {
			donationBefore = donationdao.getBeforeDetail(numBefore, email);
		} else {
			donationBefore = null;
		}

		if (donationdata == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");

		request.setAttribute("donationdata", donationdata);
		request.setAttribute("donationBefore", donationBefore);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // 포워드로 전송
		forward.setPath("./donation/receipt_detail.jsp");
		return forward;

	}
}