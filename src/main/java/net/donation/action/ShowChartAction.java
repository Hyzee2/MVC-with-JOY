package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.donation.db.DonationDAO;

import java.util.*;

public class ShowChartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();
		
		DonationDAO donationdao = new DonationDAO();
		
		dataMap = donationdao.getData();
		System.out.println(dataMap.toString());
		
		request.setAttribute("dataMap", dataMap);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./donation/donation_chart.jsp"); 
		return forward;
			
		
	}

}
