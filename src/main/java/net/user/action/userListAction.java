package net.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.user.db.UserBean;
import net.user.db.UserDAO;

import java.util.*;

public class userListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO userdao=new UserDAO(); // db 연결
		
		List<Map.Entry<UserBean, String>> userlist=new ArrayList<>(); 
		
		userlist = userdao.getUserList();
		
		request.setAttribute("userlist", userlist); // 포워드로 넘길 때는 request에 넣어서 넘긴다
		
		ActionForward forward= new ActionForward(); // 전송방식과 경로를 설정할 수 있는 ActionForward 클래스 객체 생성 
	   	forward.setRedirect(false); // 포워드 방식 (url 변동 없음. 넘겨준 값을 뷰에서도 같은 권한을 갖고 사용하기 위하여)
   		forward.setPath("./admin/user_list.jsp"); // 이동할 뷰 페이지 경로 설정 
   		return forward; // 정보를 담은 forward 변수를 반환해줌 
	 
	}

}
