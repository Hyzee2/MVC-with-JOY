package net.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.user.db.UserBean;
import net.user.db.UserDAO;

import java.util.*;

public class userListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO userdao=new UserDAO(); // db ����
		
		List<Map.Entry<UserBean, String>> userlist=new ArrayList<>(); 
		
		userlist = userdao.getUserList();
		
		request.setAttribute("userlist", userlist); // ������� �ѱ� ���� request�� �־ �ѱ��
		
		ActionForward forward= new ActionForward(); // ���۹�İ� ��θ� ������ �� �ִ� ActionForward Ŭ���� ��ü ���� 
	   	forward.setRedirect(false); // ������ ��� (url ���� ����. �Ѱ��� ���� �信���� ���� ������ ���� ����ϱ� ���Ͽ�)
   		forward.setPath("./admin/user_list.jsp"); // �̵��� �� ������ ��� ���� 
   		return forward; // ������ ���� forward ������ ��ȯ���� 
	 
	}

}
