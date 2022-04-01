package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		// 스캐너를 이용해서 
		// 수정할 아이디, 해당 아이디에 대한 새로운 비밀번호,
	    // 새로운 이름, 새로운 이메일을 입력받아주시면 됩니다.
		Scanner in = new Scanner(System.in);
		System.out.println("수정하고 싶은 칼럼을 포함한 아이디를 입력해주세요.");
		String id = in.next();
		System.out.println("새로운 비밀번호를 입력해주세요.");
		String pw = in.next();
		System.out.println("새로운 이름을 입력해주세요.");
		String name = in.next();
		System.out.println("새로운 이메일을 입력해주세요.");
		String email = in.next();
		in.close();
		// DB연동 후 쿼리문을 날려서 수정로직을 돌려주신 다음
		try {
		     Class.forName("com.mysql.cj.jdbc.Driver");
		     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
		    		                                      "root",
		    		                                      "1111"); 
		 Statement stmt = con.createStatement();
		 String sqlpw = ("UPDATE userinfo SET user_pw = '" + pw + "' WHERE user_id = '" + id + "'");
		 System.out.println("실행할 구문 : " + sqlpw);
		 String sqlname = ("UPDATE userinfo SET user_name = '" + name + "' WHERE user_id = '" + id + "'");
		 System.out.println("실행할 구문 : " + sqlname);
		 String sqlemail = ("UPDATE userinfo SET email = '" + email + "' WHERE user_id = '" + id + "'");
		 System.out.println("실행할 구문 : " + sqlemail);
		 // 삭제되었는지 SELECT 코드나 혹은 Workbench를 이용해 확인해주세요.
		 stmt.executeUpdate(sqlpw);
		 stmt.executeUpdate(sqlname);
		 stmt.executeUpdate(sqlemail); 

	    } catch(Exception e) {
			e.printStackTrace();
	  } // workbench를 이용해 수정된 내역이 반영되었는지 확인해주세요.
		System.out.println("DB자료에 적용이 완료되었습니다.");
    }

 }

