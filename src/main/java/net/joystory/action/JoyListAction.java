package net.joystory.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.joystory.db.JoyStoryBean;
import net.joystory.db.JoyStoryDAO;

import java.util.*;

public class JoyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JoyStoryDAO joydao=new JoyStoryDAO(); // db ����
		
		List<JoyStoryBean> joyStoryList=new ArrayList<>(); 
		
		joyStoryList = joydao.getJoyList();
		
		request.setAttribute("joyStoryList", joyStoryList);
		
		ActionForward forward= new ActionForward(); // ���۹�İ� ��θ� ������ �� �ִ� ActionForward Ŭ���� ��ü ���� 
	   	forward.setRedirect(false); // ������ ��� (url ���� ����. �Ѱ��� ���� �信���� ���� ������ ���� ����ϱ� ���Ͽ�)
   		forward.setPath("./board/board_list.jsp"); // �̵��� �� ������ ��� ���� 
   		return forward; // ������ ���� forward ������ ��ȯ���� 
	 
	}

}
