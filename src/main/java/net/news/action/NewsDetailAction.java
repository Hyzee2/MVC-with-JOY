package net.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.news.db.NewsBean;
import net.news.db.NewsDAO;

 public class NewsDetailAction implements Action { // JoyStory �󼼺��� 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 request.setCharacterEncoding("utf-8");
   		
		NewsDAO newsdao=new NewsDAO();
	   	NewsBean newsdata=new NewsBean();
	   	NewsBean newsBefore=new NewsBean();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // request�� ���۹��� num ���� num������ �־��ش� 
		int numBefore = num-1;
		
		newsdata=newsdao.getDetail(num); // ������ �������� select  
		if(numBefore !=0) {
			newsBefore=newsdao.getDetail(numBefore);
		}
		
	   	if(newsdata==null || newsBefore==null){
	   		System.out.println("�󼼺��� ����");
	   		return null;
	   	}
	   	System.out.println("�󼼺��� ����");
	   	
	   	request.setAttribute("newsdata", newsdata);
	   	request.setAttribute("newsBefore", newsBefore);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false); // ������� ���� 
   		forward.setPath("./board/news_detail.jsp");
   		return forward;

	 }
}