package kr.co.ict.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
    // 생성자까지 만들어주세요.
	// 이미 커넥션풀 설정이 되어있으니 UserDAO에서 활성된 코드만 참조해서
	// 생성자 부분까지만 작성해서 저한테 보내주세요.
	// DB접속시 필요한 변수들을 아래에 선언합니다.
		private String dbType = "com.mysql.cj.jdbc.Driver";
		private String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		private String connectId = "root";
		private String connectPw = "1111";
		private DataSource ds;
			private static BoardDAO bdao = new BoardDAO();
            // 생성자 생성
			private BoardDAO() {
				try {
					Context ct = new InitialContext();
					ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
				} catch (Exception e) {
					e.printStackTrace();
				}
		    }
            
			public static BoardDAO getInstance() {
				if(bdao == null) {
					bdao = new BoardDAO();
				}
				return bdao;
			}
			
			// 게시판의 전체 글을 가져오는 getBoardList() 메서드를 작성해주세요.
			// 전체 글을 가져오므로 List<BoardVO>를 리턴하면 됩니다.
			// 작성시 UserDAO의 getAllUserList() 메서드를 참조해주세요.
			public List<BoardVO> getBoardList(){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<BoardVO> boardList = new ArrayList<>();
				try {
					con = ds.getConnection();
					String sql = "SELECT * FROM boardTbl";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						BoardVO boardwr = new BoardVO();
						// 디버깅으로 비어있는것 확인
						System.out.println("집어넣기 전 : " + boardwr);
						// setter로 다 집어넣기
						boardwr.setBoardNum(rs.getInt(1));
						boardwr.setTitle(rs.getString(2));
						boardwr.setContent(rs.getString(3));
						boardwr.setWriter(rs.getString(4));
						boardwr.setbDate(rs.getDate(5));
						boardwr.setmDate(rs.getDate(6));
						boardwr.setHit(rs.getInt(7));
						// 다 집어넣은 후 디버깅
						System.out.println("집어넣은 후 : " + boardwr);
						// userList에 쌓기
						boardList.add(boardwr);
					}
					System.out.println("리스트에 쌓인 자료 체크 : " + boardList);	
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
				
				return boardList;
			}
}
