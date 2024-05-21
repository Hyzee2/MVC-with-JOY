package net.joystory.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.joystory.db.JoyStoryBean;
import net.joystory.db.JoyStoryDAO;

 public class JoyDetailAction implements Action { // JoyStory �󼼺��� 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 request.setCharacterEncoding("euc-kr");
   		
		JoyStoryDAO joydao=new JoyStoryDAO();
	   	JoyStoryBean joydata=new JoyStoryBean();
	   	JoyStoryBean joyBefore=new JoyStoryBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request�� ���۹��� num ���� num������ �־��ش� 
		int numBefore = num-1;
		
		joydata=joydao.getDetail(num); // ������ �������� select  
		if(numBefore !=0) {
			joyBefore=joydao.getDetail(numBefore);
		}
		
	   	if(joydata==null || joyBefore==null){
	   		System.out.println("�󼼺��� ����");
	   		return null;
	   	}
	   	System.out.println("�󼼺��� ����");
	   	System.out.println("joy url ������: "+ joydata.getImage_url());
	   	
	   	request.setAttribute("joydata", joydata);
	   	request.setAttribute("joyBefore", joyBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // ������� ���� 
   		forward.setPath("./board/joystory_detail.jsp");
   		return forward;

	 }
}