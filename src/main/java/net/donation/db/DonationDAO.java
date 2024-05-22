package net.donation.db;

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

public class DonationDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public DonationDAO() { // DonationDAO 생성하자마자 db연결 실행(커넥션 풀 방식)
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");

			if (conn == null) {
				conn = ds.getConnection();
			}
			System.out.println("연결 성공");
		} catch (Exception e) {
			System.out.println("연결 실패");
			e.printStackTrace();
			return;
		}
	}

	// 기부금영수증 목록보기
	public List<DonationBean> getDonationList() { // List형으로 반환
		String sql = "select * from Donations";

		List<DonationBean> list = new ArrayList<>(); // 여러 개의 글 목록 값을 담기 위해 ArrayList형으로 list 변수 생성

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select해서 가지고 오는 컬럼 값들이 많다면 NoticeBean 객체를 생성해서 넣어준다음, 해당 객체를 list에 add 시켜준다.
				DonationBean donation = new DonationBean();

				donation.setDonation_id(rs.getInt("donation_id"));
				donation.setUser_id(rs.getInt("user_id"));
				donation.setItem(rs.getString("item"));
				donation.setAmount(rs.getInt("amount"));
				donation.setPayment_date(rs.getDate("payment_date"));

				list.add(donation); // select 문으로 가지고 온 한 줄의 데이터들을 notice에 담아서 list에 add 해준다.
			}

			return list; // 결과 값들을 담은 list 반환
		} catch (Exception ex) {
			System.out.println("getDonationList 에러 : " + ex);
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

}
