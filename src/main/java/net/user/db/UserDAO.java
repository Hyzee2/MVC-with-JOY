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

	public UserDAO() { // NoticeDAO 생성하자마자 db연결 실행(커넥션 풀 방식)
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

	// 회원가입 사용자 추가하기
	public boolean insertUser(UserBean userdata) {
		int num = 0;
		String sql = "";

		int result = 0;

		try {
			pstmt = conn.prepareStatement("select max(user_id) from Users");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1; // 가장 마지막 번호 +1
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
			System.out.println("userInsert 실패 : " + ex);
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

		// 회원이 1 / 관리자 0 / 비회원 -1
		if (conn != null) {
			String sql = "SELECT email,password,admin FROM Users where email=?";

			System.out.println("이건 로그인 체크하는 과정중 " + email);
			System.out.println("이건 로그인 체크하는 과정중 " + password);

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, email);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					System.out.println("이건 db에서 가져옴 " + rs.getString("email"));
					System.out.println("이건 db에서 가져옴 " + rs.getString("password"));
//					if (email.equals("admin@naver.com") && password.equals("1234")) {// 관리자
//						return 0; // 관리자
//					}
					if (rs.getString("email").equals(email) && rs.getString("password").equals(password)) {
						if (rs.getBoolean("admin")) {
							return 0; // 관리자
						}
						return 1; // 회원
					}
				}
			} catch (Exception e) {
				System.out.println("로그인 조회 오류다~");
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
		return -1;// 비회원

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

		return null;// 비회원
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
