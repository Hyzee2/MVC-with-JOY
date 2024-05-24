package net.news.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NewsDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public NewsDAO() { // NoticeDAO �������ڸ��� db���� ����(Ŀ�ؼ� Ǯ ���)
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
	public List<NewsBean> getNewsList() { // List������ ��ȯ
		String sql = "select * from MediaReports";

		List<NewsBean> list = new ArrayList<>(); // ���� ���� �� ��� ���� ��� ���� ArrayList������ list ���� ����

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select�ؼ� ������ ���� �÷� ������ ���ٸ� NoticeBean ��ü�� �����ؼ� �־��ش���, �ش� ��ü�� list�� add �����ش�.
				NewsBean news = new NewsBean();

				news.setReport_id(rs.getInt("report_id"));
				news.setTitle(rs.getString("title"));
				news.setImage_url(rs.getString("image_url"));
				news.setDescription(rs.getString("description"));
				news.setPost_date(rs.getDate("post_date"));

				list.add(news); // select ������ ������ �� �� ���� �����͵��� notice�� ��Ƽ� list�� add ���ش�.
			}

			return list; // ��� ������ ���� list ��ȯ
		} catch (Exception ex) {
			System.out.println("getNewsList ���� : " + ex);
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
	public NewsBean getDetail(int num) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
		NewsBean news = null;

		try {
			pstmt = conn.prepareStatement("select * from MediaReports where report_id = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				news = new NewsBean();
				news.setReport_id(rs.getInt("report_id"));
				news.setTitle(rs.getString("title"));
				news.setImage_url(rs.getString("image_url"));
				news.setDescription(rs.getString("description"));
				news.setPost_date(rs.getDate("post_date"));
			}
			return news;
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

	// ���� �������� �۹�ȣ �޾ƿ���
	public int getBeforeNum(int num) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
		int beforeNum = 0;

		try {
			pstmt = conn.prepareStatement(
					"select report_id from MediaReports where report_id = (select max(report_id) as num from MediaReports where report_id < ?)");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				beforeNum = rs.getInt("report_id");

			}
			return beforeNum;
		} catch (Exception ex) {
			System.out.println("getBeforeNum ���� : " + ex);
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
		return 0;
	}

}
