package net.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {

	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public NoticeDAO() { // NoticeDAO 생성하자마자 db연결 실행(커넥션 풀 방식)
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");

			if (conn == null)
				conn = ds.getConnection();

			System.out.println("연결 성공");
		} catch (Exception e) {
			System.out.println("연결 실패");
			e.printStackTrace();
			return;
		}
	}

	// 작성한 공지사항 추가하기
	public boolean noticeInsert(NoticeBean noticedata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			pstmt = conn.prepareStatement("select max(notice_id) from Notices");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // 가장 마지막 번호 +1
			else
				num = 1;

			sql = "insert into Notices (notice_id,title,content,post_date,file_name) values (?,?,?,now(),?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, noticedata.getTitle());
			pstmt.setString(3, noticedata.getContent());
			pstmt.setString(4, noticedata.getFile_name());
			pstmt.setInt(5, 0);

			result = pstmt.executeUpdate();
			if (result == 0) {
				return false;
			} else {
				return true;
			}

		} catch (Exception ex) {
			System.out.println("noticeInsert 실패 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}

	// 공지사항 조회수 증가하기
	public void setReadCountUpdate(int num) throws Exception { // 공지사항 게시글 번호를 매개변수로 받는다
		String sql = "update Notices set read_count = " + "read_count+1 where notice_id = " + num;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 실패 : " + ex);
		}
	}

	// 공지사항 목록보기
	public List<NoticeBean> getNoticeList() { // List형으로 반환
		String sql = "select * from Notices";

		List<NoticeBean> list = new ArrayList<>(); // 여러 개의 글 목록 값을 담기 위해 ArrayList형으로 list 변수 생성

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select해서 가지고 오는 컬럼 값들이 많다면 NoticeBean 객체를 생성해서 넣어준다음, 해당 객체를 list에 add 시켜준다.
				NoticeBean notice = new NoticeBean();

				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setPost_date(rs.getDate("post_date"));
				notice.setFile_name(rs.getString("file_name"));
				notice.setRead_count(rs.getInt("read_count"));

				list.add(notice); // select 문으로 가지고 온 한 줄의 데이터들을 notice에 담아서 list에 add 해준다.
			}

			return list; // 결과 값들을 담은 list 반환
		} catch (Exception ex) {
			System.out.println("getNoticeList 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return list;
	}

	// 공지사항 상세보기
	public NoticeBean getDetail(int num) throws Exception { // 게시글 번호를 매개변수로 받는다
		NoticeBean notice = null;
		
		try {
			pstmt = conn.prepareStatement("select * from Notices where notice_id = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				notice = new NoticeBean();
				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setPost_date(rs.getDate("post_date"));
				notice.setFile_name(rs.getString("file_name"));
				notice.setRead_count(rs.getInt("read_count"));
			}
			return notice;
		} catch (Exception ex) {
			System.out.println("getDetail 실패 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

}
