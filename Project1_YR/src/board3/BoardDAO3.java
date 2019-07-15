package board3;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board3.BoardBean3;



public class BoardDAO3 {

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	public void insertBoard(BoardBean3 bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "SELECT MAX(num) from board3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num = 0;
			if(rs.next()) {
				num = rs.getInt("MAX(num)") + 1;
			}
			
			sql = "INSERT into board3 values(?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);			
			pstmt.executeUpdate();			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		
	}
	
	public void finsertBoard(BoardBean3 bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "SELECT MAX(num) from board3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num = 0;
			if(rs.next()) {
				num = rs.getInt("MAX(num)") + 1;
			}
			
			sql = "INSERT into board3 values(?, ?, ?, ?, ?, ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());			
			pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		
	}


	public BoardBean3 getContent(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean3 bb = null;
		try {
			con = getConnection();
			String sql = "SELECT * FROM board3 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bb = new BoardBean3();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
		}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		return bb;
	}
	
	
	public void updateReadcount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "UPDATE board3 SET readcount = readcount+1 WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			
			String sql = "select count(*) from board3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				if(pstmt != null) try {
					pstmt.close();
				} catch(SQLException se) {}
				if(con != null) try {
					con.close();
				} catch (SQLException ex) {}
				if(con != null) try {
					rs.close();
				} catch (SQLException ex) {}
		}
		return count;
	}
	
	
	public int getBoardCount(String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			
			String sql = "select count(*) from board3 where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		return count;
	}
	
	
	public List getBoardList(int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List boardList2 = new ArrayList();
		try {
			con = getConnection();
			
			String sql = "SELECT * from board3 order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean3 bb = new BoardBean3();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));				
				boardList2.add(bb);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		return boardList2;
	}
	
	
	public List getBoardList(int startRow, int pageSize, String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List boardList2 = new ArrayList();
		
		try {
			con = getConnection();
			
			String sql = "SELECT * from board3 where subject like ? order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean3 bb = new BoardBean3();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));				
				boardList2.add(bb);
				
		}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {
				pstmt.close();
			} catch(SQLException se) {}
			if(con != null) try {
				con.close();
			} catch (SQLException ex) {}
			if(con != null) try {
				rs.close();
			} catch (SQLException ex) {}
		}
		return boardList2;
	}
}
	
