package net.joystory.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.joystory.db.JoyStoryBean;
import net.joystory.db.JoyStoryDAO;

 public class JoyDetailAction implements Action { // JoyStory 상세보기 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 request.setCharacterEncoding("euc-kr");
   		
		JoyStoryDAO joydao=new JoyStoryDAO();
	   	JoyStoryBean joydata=new JoyStoryBean();
	   	JoyStoryBean joyBefore=new JoyStoryBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request로 전송받은 num 값을 num변수에 넣어준다 
		int numBefore = num-1;
		
		joydata=joydao.getDetail(num); // 상세정보 가져오기 select  
		if(numBefore !=0) {
			joyBefore=joydao.getDetail(numBefore);
		}
		
	   	if(joydata==null || joyBefore==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	System.out.println("joy url 데이터: "+ joydata.getImage_url());
	   	
	   	request.setAttribute("joydata", joydata);
	   	request.setAttribute("joyBefore", joyBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // 포워드로 전송 
   		forward.setPath("./board/joystory_detail.jsp");
   		return forward;

	 }
}