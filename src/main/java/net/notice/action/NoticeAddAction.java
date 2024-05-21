package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

public class NoticeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		NoticeDAO noticedao = new NoticeDAO(); // db연결

		NoticeBean noticedata = new NoticeBean(); // bean 생성

		ActionForward forward = new ActionForward();

		String realFolder = ""; // 실제파일명
		String saveFolder = "upload"; // 저장파일명

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);

		boolean result = false;

		try {

			MultipartRequest multi = null; // 파일 업로드

			multi = new MultipartRequest(request, realFolder, fileSize, "euc-kr", new DefaultFileRenamePolicy());

			noticedata.setTitle(multi.getParameter("title"));
			noticedata.setContent(multi.getParameter("content"));
			noticedata.setFile_name(multi.getFilesystemName((String) multi.getFileNames().nextElement()));

			result = noticedao.noticeInsert(noticedata);

			if (result == false) {
				System.out.println("공지사항 등록 실패");
				return null;
			}
			System.out.println("공지사항 등록 완료");

			forward.setRedirect(true); // 리다이렉트 방식으로 전송
			forward.setPath("./NoticeList.no");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

}
