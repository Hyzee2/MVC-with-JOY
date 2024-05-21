package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

import java.util.*;

public class NoticeListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO noticedao=new NoticeDAO(); // db ����
		
		List<NoticeBean> noticelist=new ArrayList<>(); 
		
		noticelist = noticedao.getNoticeList();
		
   		// "board_list.jsp"���� �ʿ��� ������ request�� �־��� 
		request.setAttribute("noticelist", noticelist);
		
		ActionForward forward= new ActionForward(); // ���۹�İ� ��θ� ������ �� �ִ� ActionForward Ŭ���� ��ü ���� 
	   	forward.setRedirect(false); // ������ ��� (url ���� ����. �Ѱ��� ���� �信���� ���� ������ ���� ����ϱ� ���Ͽ�)
   		forward.setPath("./board/board_list.jsp"); // �̵��� �� ������ ��� ���� 
   		return forward; // ������ ���� forward ������ ��ȯ���� 
	 
	}

}
