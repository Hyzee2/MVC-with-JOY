package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.donation.db.DonationDAO;

import java.util.*;

public class ShowChartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		// 막대그래프
		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();

		DonationDAO donationdao = new DonationDAO();

		dataMap = donationdao.getData();
		System.out.println(dataMap.toString());

		request.setAttribute("dataMap", dataMap);

		// 원형 그래프
		HashMap<String, Integer> pieMap = new HashMap<String, Integer>();

		DonationDAO piedao = new DonationDAO();

		pieMap = piedao.getUserData();
		System.out.println(pieMap.toString());

		request.setAttribute("pieMap", pieMap);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/donation_chart.jsp");
		return forward;

	}

}
