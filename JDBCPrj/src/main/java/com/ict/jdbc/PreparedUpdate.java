package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedUpdate {

	public static void main(String[] args) {
		// id, pw, name, email을 입력받아서
		// 특정 id인 계정의 pw, name, email을 입력받은 값으로 갱신하는
		// UPDATE 로직을 작성해주세요.
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "1111";
				
		// 수정할 아이디 입력하기
		Scanner in = new Scanner(System.in);
		System.out.println("수정하고 싶은 칼럼을 포함한 아이디를 입력해주세요.");
		String id = in.next();
		System.out.println("새로운 비밀번호를 입력해주세요.");
		String pw = in.next();
		System.out.println("새로운 이름을 입력해주세요.");
		String name = in.next();
		System.out.println("새로운 이메일을 입력해주세요.");
		String email = in.next();
				
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
			String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?"; 
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			// ?에 들어갈 자료를 정의해줍니다.
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			// 쿼리문 실행
			pstmt.executeUpdate();
		    
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
		} System.out.println("DB조작완료");
	}
}