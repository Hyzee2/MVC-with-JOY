package net.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import net.notice.db.NoticeBean;

public class UserDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public UserDAO() { // NoticeDAO �������ڸ��� db���� ����(Ŀ�ؼ� Ǯ ���)
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

	// ȸ������ ����� �߰��ϱ�
	public boolean insertUser(UserBean userdata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			pstmt = conn.prepareStatement("select max(user_id) from Users");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // ���� ������ ��ȣ +1
			else
				num = 1;

			sql = "insert into Users (user_id,email,password,name) values (?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, userdata.getEmail());
			pstmt.setString(3, userdata.getPassword());
			pstmt.setString(4, userdata.getName());

			result = pstmt.executeUpdate();
			if (result == 0) {
				return false;
			} else {
				return true;
			}

		} catch (Exception ex) {
			System.out.println("userInsert ���� : " + ex);
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

	public int loginCheck(String email, String password) throws SQLException {

		// ȸ���� 1 / ������ 0 / ��ȸ�� -1
		if (conn != null) {
			String sql = "SELECT email,password,admin FROM Users where email=?";

			System.out.println("�̰� �α��� üũ�ϴ� ������ " + email);
			System.out.println("�̰� �α��� üũ�ϴ� ������ " + password);

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, email);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					System.out.println("�̰� db���� ������ " + rs.getString("email"));
					System.out.println("�̰� db���� ������ " + rs.getString("password"));
//					if (email.equals("admin@naver.com") && password.equals("1234")) {// ������
//						return 0; // ������
//					}
					if (rs.getString("email").equals(email) && rs.getString("password").equals(password)) {
						if (rs.getBoolean("admin")) {
							return 0; // ������
						}
						return 1; // ȸ��
					}
				}
			} catch (Exception e) {
				System.out.println("�α��� ��ȸ ������~");
				e.printStackTrace();
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
		}
		return -1;// ��ȸ��

	}

	public String getName(String email) {
		String sql = "SELECT name FROM Users where email=?";
		String username = "";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				username = rs.getString("name");
			}
			return username;
		} catch (Exception ex) {
			ex.printStackTrace();
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

		return null;// ��ȸ��
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");

			if (ds == null) {
				throw new SQLException("DataSource lookup failed: DataSource is null.");
			}

			conn = ds.getConnection();

			if (conn == null) {
				throw new SQLException("Failed to obtain a connection from the DataSource.");
			}
		} catch (NamingException e) {
			System.err.println("NamingException during JNDI lookup: " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("SQLException while obtaining connection: " + e.getMessage());
		}

		return conn;
	}

}
