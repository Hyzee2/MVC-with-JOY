package net.joystory.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.joystory.db.JoyStoryBean;
import net.joystory.db.JoyStoryDAO;

import java.util.*;

public class JoyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JoyStoryDAO joydao=new JoyStoryDAO(); // db 연결
		
		List<JoyStoryBean> joyStoryList=new ArrayList<>(); 
		
		joyStoryList = joydao.getJoyList();
		
		request.setAttribute("joyStoryList", joyStoryList);
		
		ActionForward forward= new ActionForward(); // 전송방식과 경로를 설정할 수 있는 ActionForward 클래스 객체 생성 
	   	forward.setRedirect(false); // 포워드 방식 (url 변동 없음. 넘겨준 값을 뷰에서도 같은 권한을 갖고 사용하기 위하여)
   		forward.setPath("./board/board_list.jsp"); // 이동할 뷰 페이지 경로 설정 
   		return forward; // 정보를 담은 forward 변수를 반환해줌 
	 
	}

}
