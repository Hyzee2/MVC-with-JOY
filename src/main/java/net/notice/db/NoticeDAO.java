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

	public NoticeDAO() { // NoticeDAO �������ڸ��� db���� ����(Ŀ�ؼ� Ǯ ���)
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");

			if (conn == null)
				conn = ds.getConnection();

			System.out.println("���� ����");
		} catch (Exception e) {
			System.out.println("���� ����");
			e.printStackTrace();
			return;
		}
	}

	// �ۼ��� �������� �߰��ϱ�
	public boolean noticeInsert(NoticeBean noticedata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			pstmt = conn.prepareStatement("select max(notice_id) from Notices");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // ���� ������ ��ȣ +1
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
			System.out.println("noticeInsert ���� : " + ex);
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

	// �������� ��ȸ�� �����ϱ�
	public void setReadCountUpdate(int num) throws Exception { // �������� �Խñ� ��ȣ�� �Ű������� �޴´�
		String sql = "update Notices set read_count = " + "read_count+1 where notice_id = " + num;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate ���� : " + ex);
		}
	}

	// �������� ��Ϻ���
	public List<NoticeBean> getNoticeList() { // List������ ��ȯ
		String sql = "select * from Notices";

		List<NoticeBean> list = new ArrayList<>(); // ���� ���� �� ��� ���� ��� ���� ArrayList������ list ���� ����

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select�ؼ� ������ ���� �÷� ������ ���ٸ� NoticeBean ��ü�� �����ؼ� �־��ش���, �ش� ��ü�� list�� add �����ش�.
				NoticeBean notice = new NoticeBean();

				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setPost_date(rs.getDate("post_date"));
				notice.setFile_name(rs.getString("file_name"));
				notice.setRead_count(rs.getInt("read_count"));

				list.add(notice); // select ������ ������ �� �� ���� �����͵��� notice�� ��Ƽ� list�� add ���ش�.
			}

			return list; // ��� ������ ���� list ��ȯ
		} catch (Exception ex) {
			System.out.println("getNoticeList ���� : " + ex);
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

	// �������� �󼼺���
	public NoticeBean getDetail(int num) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
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
			System.out.println("getDetail ���� : " + ex);
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
