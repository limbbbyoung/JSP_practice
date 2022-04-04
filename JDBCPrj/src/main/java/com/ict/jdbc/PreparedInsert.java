package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedInsert {

	public static void main(String[] args) {
		// Insert구문을 구현해보세요.
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "1111";
				
		// 추가할 아이디 입력하기
		Scanner scan = new Scanner(System.in);
		System.out.println("추가할 아이디를 입력해주세요.");
		String id = scan.next();
		System.out.println("추가할 아이디의 비밀번호를 입력해주세요.");
		String pw = scan.next();
		System.out.println("추가할 아이디의 이름을 입력해주세요.");
		String name = scan.next();
		System.out.println("추가할 아이디의 이메일을 입력해주세요.");
		String email = scan.next();
				
		try { 
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			
			String sql = "INSERT INTO userinfo VALUE (?, ?, ?, ?)"; 
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			// ?에 들어갈 자료를 정의해줍니다.
			pstmt.setString(1, id);// 왼쪽부터 1번째 ?에 id변수에 들어있는 사용자 입력 변수를 넣어준다는 의미
			pstmt.setString(2, pw);// 왼쪽부터 2번째 ?에 pw변수에 들어있는 사용자 입력 변수를 넣어준다는 의미
			pstmt.setString(3, name);// 왼쪽부터 3번째 ?에 name변수에 들어있는 사용자 입력 변수를 넣어준다는 의미
			pstmt.setString(4, email);// 왼쪽부터 4번째 ?에 email변수에 들어있는 사용자 입력 변수를 넣어준다는 의미
			// 쿼리문 실행
			pstmt.executeUpdate();
		    
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		} System.out.println("DB조작완료");

	}

}
