package kr.co.ict.domain;

import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
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
			public List<BoardVO> getBoardList(int pageNum){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<BoardVO> boardList = new ArrayList<>();
				try {
					con = ds.getConnection();
					int limitNum = (pageNum -1)*10;
					String sql = "SELECT * FROM boardTbl ORDER BY board_num DESC limit ?, 10";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, limitNum);
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
			
			// bno를 입력받아 해당 글 번호의 게시글 하나만 가져오는 
			// getBoardDetail(int bno)를 DAO에 생성해주세요.
	        
			// boardTbl에서 board_num이 primary key이기 때문에 
			// row 1개를 가져오거나(글번호존재시), 안가져오거나(글번호가 존재하지 않음)
			public BoardVO getBoardDetail(int boardNum){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				BoardVO board = new BoardVO();
				// upHit(boardNum); // getBoardDetail 내부에서 호출하도록 해도 조회수는 올라감
				try {
					con = ds.getConnection();
					String sql = "SELECT * FROM boardTbl WHERE board_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, boardNum);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						// 디버깅으로 비어있는것 확인
						System.out.println("집어넣기 전 : " + board);
						// setter로 다 집어넣기
						board.setBoardNum(rs.getInt(1));
						board.setTitle(rs.getString(2));
						board.setContent(rs.getString(3));
						board.setWriter(rs.getString(4));
						board.setbDate(rs.getDate(5));
						board.setmDate(rs.getDate(6));
						board.setHit(rs.getInt(7));
						// 다 집어넣은 후 디버깅
						System.out.println("집어넣은 후 : " + board);
					} else {
						System.out.println("계정이 없습니다.");
					}
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
				return board;
			}
			
			// INSERT 실행하는 메서드
			public String boardInsert(String writer, String title, String content){
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ds.getConnection();
					String sql = "INSERT INTO boardTbl(title, content, writer) VALUES(?, ?, ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, writer);
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
				String succ = "글쓰기가 완료되었습니다.";
				return succ;
			}
			
			// 데이터를 삭제하는 DAO의 메서드
			public void boardDelete(int boardNum){
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ds.getConnection();
					String sql = "DELETE FROM boardTbl WHERE board_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, boardNum);
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
			}
			
			// 존재하는 데이터를 업데이트하는 method
			public void boardUpdate(String content, int boardNum) {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ds.getConnection();
					String sql = "UPDATE boardTbl SET content=?, mdate=now() WHERE board_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, content);
					pstmt.setInt(2, boardNum);
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
			}
			// 조회수가 증가되는 수행 로직
			public void upHit(int boardNum) {
				Connection con = null;
				PreparedStatement pstmt = null;
				try {
					con = ds.getConnection();
					String sql = "UPDATE boardTbl SET hit = hit + 1 WHERE board_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, boardNum);
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
			} // 조회수 증가 로직 끝
			
			// 전체 게시글의 갯수를 가져오는 메서드
			public int getAllBoardCount() {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int boardCount = 0;
				try {
					con = ds.getConnection();
					String sql = "SELECT count(*) FROM boardTbl";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();	
		
					if(rs.next()) {
						boardCount = rs.getInt(1);
					}
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
				return boardCount;
			}
			
}
