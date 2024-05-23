package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;
import net.user.db.UserBean;

// 후원하기 폼 내용 insert하는 액션 컨트롤러 (1. UserDAO에서 user_id 가져오기   2. DonationDAO에서 모든 값 insert 하기 )
public class DonationAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		
		DonationDAO donationdao=new DonationDAO();
		
	   	DonationBean donationdata=new DonationBean();
	   	UserBean userdata = new UserBean();
	   	
	   	int user_id=0;
	   	boolean result=false;
	   	
	   	try {
	   		userdata.setEmail(request.getParameter("email"));
	   		user_id=donationdao.getId(userdata);
	   		
   			donationdata.setUser_id(user_id);
   			donationdata.setItem(request.getParameter("item"));
   			donationdata.setAmount(Integer.parseInt(request.getParameter("amount")));
   			donationdata.setPayment_date(request.getParameter("payment_date"));
   			donationdata.setBank_name(request.getParameter("bank_name"));
   			donationdata.setAccount_number(request.getParameter("account_number"));
   			
	   		result=donationdao.insertDonation(donationdata);
	   		
	   		if(result==false){
	   			System.out.println("insert 실패");
	   			return null;
	   		}
	   		System.out.println("insert 완료");
	   		
	   		forward.setRedirect(true); // 리다이렉트 방식으로 전송
	   		forward.setPath("./ReceiptLogin.do"); // 기부금 영수증으로 가서 로그인하도록 이동
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	


}
