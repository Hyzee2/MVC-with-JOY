package net.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.news.db.NewsBean;
import net.news.db.NewsDAO;

 public class NewsDetailAction implements Action { // JoyStory 상세보기 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 request.setCharacterEncoding("utf-8");
   		
		NewsDAO newsdao=new NewsDAO();
	   	NewsBean newsdata=new NewsBean();
	   	NewsBean newsBefore=new NewsBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request로 전송받은 num 값을 num변수에 넣어준다 
		int numBefore = num-1;
		
		newsdata=newsdao.getDetail(num); // 상세정보 가져오기 select  
		if(numBefore !=0) {
			newsBefore=newsdao.getDetail(numBefore);
		}
		
	   	if(newsdata==null || newsBefore==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("newsdata", newsdata);
	   	request.setAttribute("newsBefore", newsBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // 포워드로 전송 
   		forward.setPath("./board/news_detail.jsp");
   		return forward;

	 }
}