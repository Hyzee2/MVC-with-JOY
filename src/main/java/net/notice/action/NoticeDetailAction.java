package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;


 public class NoticeDetailAction implements Action { // 게시글 상세보기 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		NoticeDAO noticedao=new NoticeDAO();
	   	NoticeBean noticedata=new NoticeBean();
	   	NoticeBean noticeBefore=new NoticeBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request로 전송받은 num 값을 num변수에 넣어준다 
		int numBefore = noticedao.getBeforeNum(num);
		
		System.out.println("numBefore: "+numBefore);
		
		noticedao.setReadCountUpdate(num); // 조회수 증가 update
		noticedata=noticedao.getDetail(num); // 상세정보 가져오기 select  
		if(numBefore !=0) {
			noticeBefore=noticedao.getDetail(numBefore);
		}
		
	   	if(noticedata==null || noticeBefore==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	System.out.println("noticeBefore 데이터: "+ noticeBefore.getTitle());
	   	
	   	request.setAttribute("noticedata", noticedata);
	   	request.setAttribute("noticeBefore", noticeBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // 포워드로 전송 
   		forward.setPath("./board/notice_detail.jsp");
   		return forward;

	 }
}