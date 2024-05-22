package net.news.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	// req, res 매개변수로 path와 전송방식을 결정해서 ActionForward 형으로 반환해야 한다
	// 
}
