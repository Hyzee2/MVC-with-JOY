package net.joystory.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.notice.db.NoticeBean;

public class JoyStoryDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public JoyStoryDAO() { // NoticeDAO �������ڸ��� db���� ����(Ŀ�ؼ� Ǯ ���)
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

	// JOY STORY ��Ϻ���
	public List<JoyStoryBean> getJoyList() { // List������ ��ȯ
		String sql = "select * from JoyStories";

		List<JoyStoryBean> list = new ArrayList<>(); // ���� ���� �� ��� ���� ��� ���� ArrayList������ list ���� ����

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select�ؼ� ������ ���� �÷� ������ ���ٸ� NoticeBean ��ü�� �����ؼ� �־��ش���, �ش� ��ü�� list�� add �����ش�.
				JoyStoryBean joystory = new JoyStoryBean();

				joystory.setStory_id(rs.getInt("story_id"));
				joystory.setTitle(rs.getString("title"));
				joystory.setImage_url(rs.getString("image_url"));
				joystory.setDescription(rs.getString("description"));
				joystory.setPost_date(rs.getDate("post_date"));

				list.add(joystory); // select ������ ������ �� �� ���� �����͵��� notice�� ��Ƽ� list�� add ���ش�.
			}

			return list; // ��� ������ ���� list ��ȯ
		} catch (Exception ex) {
			System.out.println("getJoyList ���� : " + ex);
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

	// Joy Story �󼼺���
	public JoyStoryBean getDetail(int num) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
		JoyStoryBean joystory = null;

		try {
			pstmt = conn.prepareStatement("select * from JoyStories where story_id = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				joystory = new JoyStoryBean();
				joystory.setStory_id(rs.getInt("story_id"));
				joystory.setTitle(rs.getString("title"));
				joystory.setImage_url(rs.getString("image_url"));
				joystory.setDescription(rs.getString("description"));
				joystory.setPost_date(rs.getDate("post_date"));
			}
			return joystory;
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
