package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		// Scanner로 id, pw, name, email을 입력받아
		// INSERT INTO 구문을 이용해 DB에 데이터를 적재하도록 해보겠습니다.
		Scanner in = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
		String id = in.next();
		System.out.println("비밀번호를 입력해주세요.");
		String pw = in.next();
		System.out.println("이름을 입력해주세요.");
		String name = in.next();
		System.out.println("이메일을 입력해주세요.");
		String email = in.next();
		in.close();
		// SELECT Q1처럼 작성해주시되(입력받기, DB연결, 쿼리문 실행 등...)
		// SELECT 구문을 제외한 나머지 INSERT, DELETE, UPDATE 구문은
		// 조회목적으로 날리는 데이터가 없기 때문에 ResultSet을 필요로 하지 않습니다.
		// 실행이 된 다음 MySQL Workbench를 켜서 데이터 입력 여부만 확인해주시거나 
		// 혹은 SELECTQ1에 입력한 아이디를 넣어 확인해주시면 됩니다.
		try {
		     Class.forName("com.mysql.cj.jdbc.Driver");
		     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
		    		                                      "root",
		    		                                      "1111"); 
		 Statement stmt = con.createStatement();
		 String sql = ("INSERT INTO userinfo VALUE ('"
		 		+ id + "', '" + pw + "', '" + name + "', '"
		 		+ email + "')");
		 System.out.println("실행할 구문 : " + sql);
		 // 쿼리문 실행시 SELECT 구문은 excuteQuery("쿼리문");을 호출했지만
		 // SELECT가 아닌 구문은 
		 
		 stmt.executeUpdate(sql);

	    } catch(Exception e) {
			e.printStackTrace();
		}
    }
 }
