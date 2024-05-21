package net.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.user.db.UserBean;
import net.user.db.UserDAO;

// 회원정보 insert하는 액션 컨트롤러 
public class JoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		UserDAO userdao=new UserDAO();
		
	   	UserBean userdata=new UserBean();
	   	
	   	ActionForward forward=new ActionForward();
   		
   		boolean result=false;
   		
   		try{
   			userdata.setEmail(request.getParameter("email"));
   			userdata.setPassword(request.getParameter("password"));
   			userdata.setName(request.getParameter("name"));
   			
	   		result=userdao.insertUser(userdata);
	   		
	   		if(result==false){
	   			System.out.println("insert 실패");
	   			return null;
	   		}
	   		System.out.println("insert 완료");
	   		
	   		forward.setRedirect(true); // 리다이렉트 방식으로 전송
	   		forward.setPath("./Main.lo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	


}
