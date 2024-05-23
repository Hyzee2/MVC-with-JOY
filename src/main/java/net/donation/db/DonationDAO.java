package net.donation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.user.db.UserBean;

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

	public HashMap<String, Integer> getData() {
		String sql = "select item, sum(amount) AS total_amount from Donations group by item";

		HashMap<String, Integer> dataMap = new HashMap<>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String item = rs.getString("item");
				Integer sum = rs.getInt("total_amount");
				dataMap.put(item, sum);
			}
			return dataMap;
		} catch (Exception ex) {
			System.out.println("getData ���� : " + ex);
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
		return dataMap;

	}

	// ��αݿ����� ��Ϻ���
	public List<DonationBean> getDonationList(int user_id) { // List������ ��ȯ
		String sql = "select * from Donations where user_id=?";

		List<DonationBean> list = new ArrayList<>(); // ���� ���� �� ��� ���� ��� ���� ArrayList������ list ���� ����

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) { // select�ؼ� ������ ���� �÷� ������ ���ٸ� NoticeBean ��ü�� �����ؼ� �־��ش���, �ش� ��ü�� list�� add �����ش�.
				DonationBean donation = new DonationBean();

				donation.setDonation_id(rs.getInt("donation_id"));
				donation.setUser_id(rs.getInt("user_id"));
				donation.setItem(rs.getString("item"));
				donation.setAmount(rs.getInt("amount"));
				donation.setPayment_date(rs.getString("payment_date"));
				donation.setBank_name(rs.getString("bank_name"));
				donation.setAccount_number(rs.getString("account_number"));
				donation.setStart_date(rs.getDate("start_date"));

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

	// email�� user_id ��������
	public int getId(UserBean userdata) {
		String sql = "select user_id from Users where email=?";
		int user_id = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userdata.getEmail());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user_id = rs.getInt("user_id");
			}
			return user_id;
		} catch (Exception ex) {
			System.out.println("getId ���� : " + ex);
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

	// �Ŀ��ϱ� ��û�� �߰��ϱ�
	public boolean insertDonation(DonationBean donationdata) {

		int num = 0;
		String sql = "";

		int result = 0;

		try {
			pstmt = conn.prepareStatement("select max(donation_id) from Donations");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // ���� ������ ��ȣ +1
			else
				num = 1;

			sql = "insert into Donations (donation_id,user_id,item,amount,payment_date,bank_name,account_number,start_date) values (?,?,?,?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, donationdata.getUser_id());
			pstmt.setString(3, donationdata.getItem());
			pstmt.setInt(4, donationdata.getAmount());
			pstmt.setString(5, donationdata.getPayment_date());
			pstmt.setString(6, donationdata.getBank_name());
			pstmt.setString(7, donationdata.getAccount_number());

			result = pstmt.executeUpdate();
			if (result == 0) {
				return false;
			} else {
				return true;
			}

		} catch (Exception ex) {
			System.out.println("insertDonation ���� : " + ex);
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

	// ��αݿ����� �󼼺���
	public DonationBean getDetail(int num) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
		DonationBean donation = null;

		try {
			pstmt = conn.prepareStatement("select * from Donations where donation_id = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				donation = new DonationBean();
				donation.setDonation_id(rs.getInt("donation_id"));
				donation.setUser_id(rs.getInt("user_id"));
				donation.setItem(rs.getString("item"));
				donation.setAmount(rs.getInt("amount"));
				donation.setPayment_date(rs.getString("payment_date"));
				donation.setBank_name(rs.getString("bank_name"));
				donation.setAccount_number(rs.getString("account_number"));
				donation.setStart_date(rs.getDate("start_date"));
			}
			return donation;
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

	// ��αݿ����� ���� ��Ϻ���
	public DonationBean getBeforeDetail(int num, String email) throws Exception { // �Խñ� ��ȣ�� �Ű������� �޴´�
		DonationBean donation = null;

		try {
			pstmt = conn.prepareStatement(
					"select * from Donations join Users on Donations.user_id=Users.user_id where email = ? and donation_id=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				donation = new DonationBean();
				donation.setDonation_id(rs.getInt("donation_id"));
				donation.setUser_id(rs.getInt("user_id"));
				donation.setItem(rs.getString("item"));
				donation.setAmount(rs.getInt("amount"));
				donation.setPayment_date(rs.getString("payment_date"));
				donation.setBank_name(rs.getString("bank_name"));
				donation.setAccount_number(rs.getString("account_number"));
				donation.setStart_date(rs.getDate("start_date"));
			}
			return donation;
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
