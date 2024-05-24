package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;


 public class NoticeDetailAction implements Action { // �Խñ� �󼼺��� 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		NoticeDAO noticedao=new NoticeDAO();
	   	NoticeBean noticedata=new NoticeBean();
	   	NoticeBean noticeBefore=new NoticeBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request�� ���۹��� num ���� num������ �־��ش� 
		int numBefore = noticedao.getBeforeNum(num);
		
		System.out.println("numBefore: "+numBefore);
		
		noticedao.setReadCountUpdate(num); // ��ȸ�� ���� update
		noticedata=noticedao.getDetail(num); // ������ �������� select  
		if(numBefore !=0) {
			noticeBefore=noticedao.getDetail(numBefore);
		}
		
	   	if(noticedata==null || noticeBefore==null){
	   		System.out.println("�󼼺��� ����");
	   		return null;
	   	}
	   	System.out.println("�󼼺��� ����");
	   	System.out.println("noticeBefore ������: "+ noticeBefore.getTitle());
	   	
	   	request.setAttribute("noticedata", noticedata);
	   	request.setAttribute("noticeBefore", noticeBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // ������� ���� 
   		forward.setPath("./board/notice_detail.jsp");
   		return forward;

	 }
}