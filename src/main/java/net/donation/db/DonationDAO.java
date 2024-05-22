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

	public DonationDAO() { // DonationDAO �������ڸ��� db���� ����(Ŀ�ؼ� Ǯ ���)
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");

			if (conn == null) {
				conn = ds.getConnection();
			}
			System.out.println("���� ����");
		} catch (Exception e) {
			System.out.println("���� ����");
			e.printStackTrace();
			return;
		}
	}

	// ��αݿ����� ��Ϻ���
	public List<DonationBean> getDonationList() { // List������ ��ȯ
		String sql = "select * from Donations";

		List<DonationBean> list = new ArrayList<>(); // ���� ���� �� ��� ���� ��� ���� ArrayList������ list ���� ����

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) { // select�ؼ� ������ ���� �÷� ������ ���ٸ� NoticeBean ��ü�� �����ؼ� �־��ش���, �ش� ��ü�� list�� add �����ش�.
				DonationBean donation = new DonationBean();

				donation.setDonation_id(rs.getInt("donation_id"));
				donation.setUser_id(rs.getInt("user_id"));
				donation.setItem(rs.getString("item"));
				donation.setAmount(rs.getInt("amount"));
				donation.setPayment_date(rs.getDate("payment_date"));

				list.add(donation); // select ������ ������ �� �� ���� �����͵��� notice�� ��Ƽ� list�� add ���ش�.
			}

			return list; // ��� ������ ���� list ��ȯ
		} catch (Exception ex) {
			System.out.println("getDonationList ���� : " + ex);
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
