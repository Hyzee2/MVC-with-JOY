package net.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 public class logoutAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
 
		HttpSession session = request.getSession();
		session.invalidate(); 
		
   		System.out.println("�α׾ƿ� �Ϸ�");
   		
   		forward.setRedirect(true);
   		forward.setPath("./LogoutView.lo");
   		return forward;
		
	 }
}