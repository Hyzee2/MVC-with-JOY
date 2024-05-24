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

	public NewsDAO() { // NoticeDAO 생성하자마자 db연결 실행(커넥션 풀 방식)
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

	// JOY STORY 목록보기
	public List<NewsBean> getNewsList() { // List형으로 반환
		String sql = "select * from MediaReports";

		List<NewsBean> list = new ArrayList<>(); // 여러 개의 글 목록 값을 담기 위해 ArrayList형으로 list 변수 생성

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select해서 가지고 오는 컬럼 값들이 많다면 NoticeBean 객체를 생성해서 넣어준다음, 해당 객체를 list에 add 시켜준다.
				NewsBean news = new NewsBean();

				news.setReport_id(rs.getInt("report_id"));
				news.setTitle(rs.getString("title"));
				news.setImage_url(rs.getString("image_url"));
				news.setDescription(rs.getString("description"));
				news.setPost_date(rs.getDate("post_date"));

				list.add(news); // select 문으로 가지고 온 한 줄의 데이터들을 notice에 담아서 list에 add 해준다.
			}

			return list; // 결과 값들을 담은 list 반환
		} catch (Exception ex) {
			System.out.println("getNewsList 에러 : " + ex);
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

	// Joy Story 상세보기
	public NewsBean getDetail(int num) throws Exception { // 게시글 번호를 매개변수로 받는다
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

	// 이전 공지사항 글번호 받아오기
	public int getBeforeNum(int num) throws Exception { // 게시글 번호를 매개변수로 받는다
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
			System.out.println("getBeforeNum 실패 : " + ex);
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
