package net.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.user.db.UserDAO;

 public class loginAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("UTF-8");
		 
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 
		 System.out.println(email);
		 System.out.println(password);
		 
		 UserDAO userdao=new UserDAO();
		 
		 try {
			 System.out.println(userdao.getConnection().toString());
			 int usercheck=userdao.loginCheck(email, password); // 로그인 회원 여부 확인  
			 
			 if(usercheck == -1){// 로그인한 회원이 일치하지 않는 경우 
			   		response.setContentType("text/html;charset=UTF-8");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('잘못된 아이디와 비밀번호 입니다.');");
			   		out.println("location.href='./Main.lo';");
			   		out.println("</script>");
			   		out.close();
			   		return null;
			 }else if(usercheck == 0) {
				 System.out.println("관리자로 로그인 완료");
				 HttpSession session = request.getSession();
				 session.setAttribute("email", email);
				 session.setAttribute("admin", true);
				 
				 forward.setRedirect(true); // 리다이렉트로 전송 ( url 변경) 
				 forward.setPath("./Main.lo?email="+email);
				 return forward;
			 }else if(usercheck == 1) {
				 System.out.println("일반 회원 로그인 완료");
				 HttpSession session = request.getSession();
				 session.setAttribute("email", email);
				 
				 forward.setRedirect(true); // 리다이렉트로 전송 ( url 변경) 
				 forward.setPath("./Main.lo");
				 return forward;
			 }
			 }catch(Exception ex) {
				 ex.printStackTrace();
			 }
		 return null;
		 
	 }
}