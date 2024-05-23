package net.donation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.donation.db.DonationBean;
import net.donation.db.DonationDAO;
import net.user.db.UserBean;

// �Ŀ��ϱ� �� ���� insert�ϴ� �׼� ��Ʈ�ѷ� (1. UserDAO���� user_id ��������   2. DonationDAO���� ��� �� insert �ϱ� )
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
	   			System.out.println("insert ����");
	   			return null;
	   		}
	   		System.out.println("insert �Ϸ�");
	   		
	   		forward.setRedirect(true); // �����̷�Ʈ ������� ����
	   		forward.setPath("./ReceiptLogin.do"); // ��α� ���������� ���� �α����ϵ��� �̵�
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	


}
