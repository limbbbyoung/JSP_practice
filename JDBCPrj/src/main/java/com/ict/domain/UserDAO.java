package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// DAO클래스는 DB연동시 반복적으로 작성하는 코드를 중복 작성하지 않기 위해 작성합니다.
public class UserDAO {
	// DB접속시 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	private String connectId = "root";
	private String connectPw = "1111";

	// 생성자를 이용해 생성할 때 자동으로 Class.forName()을 세팅하게 만들어줍니다.
	// 어떤 쿼리문을 실행하더라도 위의 DB접속 변수와 DB종류지정은 무조건 하기에 생성자로 생성합니다.
	public UserDAO() {
		try {
			Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// getAllUserList.jsp의 핵심 로직을 DAO로 옮겨서 작성해보겠습니다.
	// getAllUserList는 전체 유저목록을 출력해주고 있기 때문에
	// userinfo 테이블의 row 여러개를 받아올 수 있어야 합니다.
	// 그래서 리턴 자료형으로 List<UserVO> 를 리턴해야 합니다.
	// UserVO가 row 한 개를 저장할 수 있으므로 UserVO를 여러개 연달아 저장하는 자료가 필요합니다.
	public List<UserVO> getAllUserList(){
		// .jsp에서 로드할때는 페이지가 옮겨가면 어차피 다 삭제되었기 때문에 .close()를 
		// 해줘도 안해줘도 큰 상관이 없었습니다.
		// 그러나 DAO에서는 회수를 안 해주면 힙에 데이터가 계속 쌓여 시스템에 부하가 생깁니다.
		// 그래서 꼬박꼬박 접속이 끝나면 .close()를 해 줘야 합니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// ResultSet은 실행쿼리문이 SELECT 구문인 경우 결과값을 받기 위해 필요합니다.
		// 결과로 DB에서 꺼내올 user들의 목록도 미리 선언해둡니다.
		List<UserVO> userList = new ArrayList<>();
		
		// 필요한 모든 변수가 선언되었다면 try블럭을 선언합니다.
		try {
			// getAllUserList.jsp를 참조해 아래 로직을 작성완료해주세요.
			// Connection 생성
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			// 쿼리문 저장
			String sql = "SELECT * FROM userinfo";
			// PreparedStatement에 쿼리문 입력
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 유저 한 명의 정보를 담을 수 있는 VO 생성
				UserVO user = new UserVO();
				// 디버깅으로 비어있는것 확인
				System.out.println("집어넣기 전 : " + user);
				// setter로 다 집어넣기
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
				// 다 집어넣은 후 디버깅
				System.out.println("집어넣은 후 : " + user);
				// userList에 쌓기
				userList.add(user);
			}
			System.out.println("리스트에 쌓인 자료 체크 : " + userList);	
		} catch(Exception e) {
			e.printStackTrace();
		} finally { 
			try {
			con.close();
			pstmt.close();
			rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return userList;
	} // getAllUserList() 끝나는 지점.
	
	public UserVO getUserInfo(String userId) {

		Connection con = null;
		ResultSet rs = null;	
		PreparedStatement pstmt = null;
		// 유저정보를 저장할 수 있는 변수를 생성합니다
		UserVO user = new UserVO();
			try { 
				Class.forName(dbType);
				con = DriverManager.getConnection(connectUrl, connectId, connectPw);
				
			    String sql = "SELECT * FROM userinfo WHERE user_id=?";
			     
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				// rs내부 데이터를 user변수에 옮겨넣어주세요.
				System.out.println("데이터 입력 전 : " + user);
				if(rs.next()) {
					user.setUserId(rs.getString(1));
					user.setUserPw(rs.getString(2));
					user.setUserName(rs.getString(3));
					user.setEmail(rs.getString(4));
				}
				System.out.println("데이터 입력 후 : " + user);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
					rs.close();
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			return user;
	}// getUserInfo() 끝나는 지점
	
	// 유저 탈퇴 기능을 DAO로 옮겨서 만들겠습니다.
	// 유저 탈퇴시 입력받는 자료가 user_id이고
	// DELETE 구문은 결과자료가 없습니다. 따라서 리턴자료형을 맞게 적어주시면 됩니다.
	public String userDelete(String userId) {
		//Connection, PreparedStatement를 생성해주신 다음 try~catch쪽에서 처리해주세요.
		Connection con = null;	
		PreparedStatement pstmt = null;
			try { 
				Class.forName(dbType);
				con = DriverManager.getConnection(connectUrl, connectId, connectPw);
				
			    String sql = "DELETE FROM userinfo WHERE user_id=?";
			     
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.executeUpdate();

			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			String complete = "DB 데이터 삭제 완료";
			return complete;
	} // userDelete() 끝나는 시점
	
	// userJoinCheck
	public String userJoinCheck(String userId, String userPw, String userName, String Email) {
		Connection con = null;	
		PreparedStatement pstmt = null;
			try { 
				Class.forName(dbType);
				con = DriverManager.getConnection(connectUrl, connectId, connectPw);
				
			    String sql = "INSERT INTO userinfo VALUE (?, ?, ?, ?)";
			     
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, userPw);
				pstmt.setString(3, userName);
				pstmt.setString(4, Email);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			String complete = "DB 데이터 추가 완료";
			return complete;
	} // userJoinCheck 끝나는 시점
	
	// userUpdateCheck
	public String userUpdateCheck(String Up_id, String Up_pw, String Up_name, String Up_Email){
		Connection con = null;	
		PreparedStatement pstmt = null;
			try { 
				Class.forName(dbType);
				con = DriverManager.getConnection(connectUrl, connectId, connectPw);
				
			    String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";
			     
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, Up_pw);
				pstmt.setString(2, Up_name);
				pstmt.setString(3, Up_Email);
				pstmt.setString(4, Up_id);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			String update = "DB 데이터 수정 완료";
			return update;
	} // userUpdateCheck 끝나는 지점
	
}// UserDAO 끝나는 지점
