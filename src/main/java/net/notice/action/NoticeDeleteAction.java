package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeDAO;

public class NoticeDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
	   	boolean result=false;
	   	
	   	int num=Integer.parseInt(request.getParameter("num")); // 공지사항 글 id 
	   	
	   	NoticeDAO noticedao=new NoticeDAO();
	   	
	   	result=noticedao.noticeDelete(num);
	   	if(result==false){
	   		System.out.println("공지사항 삭제 실패");
	   		return null;
	   	}
	   	
	   	System.out.println("공지사항 삭제 성공");
	   	forward.setRedirect(false); // 리다이렉드 방식 
   		forward.setPath("./board/delete.jsp");
   		return forward;
	 }
}