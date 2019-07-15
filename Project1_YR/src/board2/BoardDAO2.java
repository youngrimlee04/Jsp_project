package board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class BoardDAO2 {
	private Connection getConnection() throws Exception{

	Context init=new InitialContext(); 
	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/mysqlDB"); //java:comp/env/는 위치 jdbc/mysqlDB는 이름
	Connection con=ds.getConnection();
	return con;
}
		
	
	public int userCheck(String id, String pass) {
		int check = -1;
		Connection con=null;
        PreparedStatement pstmt=null;
		ResultSet rs=null;
		 
		try {
			con = getConnection();
		
			// 3단계 sql id 조건 만족하면 member 정보 가져오기
			String sql = "select * from board2 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			// 4단계 rs=실행결과 저장
			rs = pstmt.executeQuery();

			// 5단계 첫행 rs 이동해서 데이터 있으면 아이디 있음
			// 비번 비교 맞으면 1 틀리면 0 없으면 아이디 없음 -1

			if (rs.next() == true) {
				if (pass.equals(rs.getString("pass"))) {
					check = 1;

				} else {
					check = 0; // 비밀번호 틀림
				}
			} else {
				check = -1;
			}

		} catch (Exception e) {

		}
		finally {
			if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}

	return check;

	}


// 전체값 뽑는거니까 특정값 () 안에 넘겨받을 필요 없음
public int getBoardCount() {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	BoardBean2 bb2=new BoardBean2();
	
	int count=0;
	
	try {
		con = getConnection();			 
		String sql = "select count(*) from board2";
		pstmt = con.prepareStatement(sql);				
		
		// 4단계 sql 실행
		rs=pstmt.executeQuery();
		
		if(rs.next()) {					
			//열 count*를 들고 옴 즉 cmd에 있는 count 값을 count 변수에 저장
			count=rs.getInt("count(*)");
		}

	} catch (Exception e) {
		e.printStackTrace();
		
	}finally {				
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return count;				
}		

//제목에 검색어에 해당되는 것을 찾아서 게시판의 개수 얻어오기
public int getBoardCount(String search) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	BoardBean2 bb2=new BoardBean2();

	
	int count=0;
	
	try {
		con = getConnection();			 
		String sql = "select count(*) from board2 where subject like ?";
		pstmt = con.prepareStatement(sql);	
		//위의 ? 값 받아오려고 아래와 같이 씀
		pstmt.setString(1, "%"+search+"%");
		
		// 4단계 sql 실행
		rs=pstmt.executeQuery();
		
		if(rs.next()) {					
			//열 count*를 들고 옴 즉 cmd에 있는 count 값을 count 변수에 저장
			count=rs.getInt("count(*)");
		}

	} catch (Exception e) {
		e.printStackTrace();
		
	}finally {				
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return count;
				
}		

public List getBoardList() {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;

	List boardList=new ArrayList();
	//배열 생성 코드
	
	try {
		con = getConnection();
		String sql="select * from board2 order by num desc";
		pstmt=con.prepareStatement(sql);

		rs=pstmt.executeQuery();
				
		while(rs.next()) {
// 자바빈 MemberBean에 name, pass 등 변수 저장
// 저장 위해 기억공간 만들기
			BoardBean2 bb2=new BoardBean2();
			bb2.setNum(rs.getInt("num"));
			bb2.setName(rs.getString("name"));
			bb2.setPass(rs.getString("pass"));
			bb2.setSubject(rs.getString("subject"));
			bb2.setContent(rs.getString("content"));
			bb2.setReadcount(rs.getInt("readcount"));
			bb2.setDate(rs.getDate("date"));

			boardList.add(bb2);
	} 
	  }	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return boardList;
}

// subject의 검색한 글을 가져와서 잘라주고 정렬
public List getBoardList(int startRow,int pageSize, String search) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;

	List boardList=new ArrayList();
	//배열 생성 코드
	
	try {
		con = getConnection();

		String sql="select * from board2 where subject like ? order by num desc limit ?, ?";
		pstmt=con.prepareStatement(sql);

		pstmt.setString(1, "%"+search+"%");
		pstmt.setInt(2, startRow-1);
		pstmt.setInt(3, pageSize);
		
		rs=pstmt.executeQuery();
		
		
		while(rs.next()) {
// 자바빈 MemberBean에 id 등 변수 저장
// 저장 위해 기억공간 만들기
BoardBean2 bb2=new BoardBean2();
bb2.setNum(rs.getInt("num"));
bb2.setName(rs.getString("name"));
bb2.setPass(rs.getString("pass"));
bb2.setSubject(rs.getString("subject"));
bb2.setContent(rs.getString("content"));
bb2.setReadcount(rs.getInt("readcount"));
bb2.setDate(rs.getDate("date"));



			// 그 다음 배열(MemberList) 한 칸에 데이터 저장(set 아닌 add 사용)
boardList.add(bb2);

	} 
	  }	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return boardList;

}

public List getBoardList(int startRow,int pageSize) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;

	List boardList=new ArrayList();
	//배열 생성 코드
	
	try {
		con = getConnection();
		String sql="select * from board2 order by num desc limit ?, ?";
		//전체글을 내림차순으로 다 들고 왔는데 시작행-1~ 글의 개수 10개만큼 limit 자르겠다.
		// 잘라주는 건 mysql에만 있고 오라클은 없음
		pstmt=con.prepareStatement(sql);
        pstmt.setInt(1, startRow-1);
        // 1을 들고 갔으면 0은 포함하지 않고 1~10까지 10개
        // 시작하는 행을 포함하지 않기 때문에 -1해야 함
        pstmt.setInt(2, pageSize);
		rs=pstmt.executeQuery();
		
		
while(rs.next()) {
// 자바빈 MemberBean에 id 등 변수 저장
// 저장 위해 기억공간 만들기
BoardBean2 bb2=new BoardBean2();
bb2.setNum(rs.getInt("num"));
bb2.setName(rs.getString("name"));
bb2.setPass(rs.getString("pass"));
bb2.setSubject(rs.getString("subject"));
bb2.setContent(rs.getString("content"));
bb2.setReadcount(rs.getInt("readcount"));
bb2.setDate(rs.getDate("date"));
bb2.setFile(rs.getString("file"));




			// 그 다음 배열(MemberList) 한 칸에 데이터 저장(set 아닌 add 사용)
boardList.add(bb2);

	} 
	  }	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return boardList;

}



public BoardBean2 getBoard2(int num) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	BoardBean2 bb2=new BoardBean2();

	
	try {
		con = getConnection();
		String sql="select * from board2 where num=?";

		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		
		if(rs.next()) {
// RS의 내용을 BOARDBEAN의 멤버변수에 저장, 저장위해 BOARDBEAN객체 생성
// BOARDBEAN 바깥에 빼야 TRY 밖에서도 적용
bb2.setNum(rs.getInt("num"));
bb2.setName(rs.getString("name"));
bb2.setPass(rs.getString("pass"));
bb2.setSubject(rs.getString("subject"));
bb2.setContent(rs.getString("content"));
bb2.setReadcount(rs.getInt("readcount"));
bb2.setDate(rs.getDate("date"));
bb2.setFile(rs.getString("file"));

	} 
	  }	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return bb2;

}


public BoardBean2 getBoard(int num) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	BoardBean2 bb2=new BoardBean2();

	
	try {
		con = getConnection();
		String sql="select * from board2 where num=?";

		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		
		if(rs.next()) {
// RS의 내용을 BOARDBEAN의 멤버변수에 저장, 저장위해 BOARDBEAN객체 생성
			// BOARDBEAN 바깥에 빼야 TRY 밖에서도 적용
bb2.setNum(rs.getInt("num"));
bb2.setName(rs.getString("name"));
bb2.setPass(rs.getString("pass"));
bb2.setSubject(rs.getString("subject"));
bb2.setContent(rs.getString("content"));
bb2.setReadcount(rs.getInt("readcount"));
bb2.setDate(rs.getDate("date"));
bb2.setFile(rs.getString("file"));

	} 
	  }	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	return bb2;

}


public void updateReadcount(int num) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	BoardBean2 bb=new BoardBean2();

	
	try {
		con = getConnection();	
		String sql = "update board2 set readcount=readcount+1 where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		
		// 4단계 sql 실행
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
				
}		

public void finsertBoard(BoardBean2 bb2) {
    Connection con=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
try {

	con = getConnection();
	// insert하고 select max 하는 것 3~5단계 writepro 보고 하기
	String sql="select max(num) from board2";
	pstmt=con.prepareStatement(sql);
   rs=pstmt.executeQuery();

	int num=0;
	if(rs.next()){
		num=rs.getInt("max(num)")+1;
	}
	
	
	// 3단계 연결정보 이용해 sql 만들고 실행할 객체 생성(preparestatement라는 자바에서 제공하는 sql 생성해주는 내장객체
	// java sql 사용)
	sql = "insert into board2(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.setString(2, bb2.getName());
	pstmt.setString(3, bb2.getPass());
	pstmt.setString(4, bb2.getSubject());
	pstmt.setString(5, bb2.getContent());
	pstmt.setInt(6,0);
//	pstmt.setDate(7,bb.getDate());
	pstmt.setString(7,bb2.getFile());

	// 4단계 sql 실행
	pstmt.executeUpdate();

} catch (Exception e) {
	e.printStackTrace();
}finally {
	
	// 예외 상관없이 마무리 작업(기억장소 정리)
	//pstmt의 기억공간이 있으면 close를 할 것
	if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
	if(con!=null) try{con.close();}catch(SQLException ex){}
}

}


public void finsertBoard2(BoardBean2 bb2) {
    Connection con=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
try {

	con = getConnection();
	// insert하고 select max 하는 것 3~5단계 writepro 보고 하기
	String sql="select max(num) from board2";
	pstmt=con.prepareStatement(sql);
   rs=pstmt.executeQuery();

	int num=0;
	if(rs.next()){
		num=rs.getInt("max(num)")+1;
	}
	
	
	// 3단계 연결정보 이용해 sql 만들고 실행할 객체 생성(preparestatement라는 자바에서 제공하는 sql 생성해주는 내장객체
	// java sql 사용)
	sql = "insert into board2(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.setString(2, bb2.getName());
	pstmt.setString(3, bb2.getPass());
	pstmt.setString(4, bb2.getSubject());
	pstmt.setString(5, bb2.getContent());
	pstmt.setInt(6,0);
//	pstmt.setDate(7,bb.getDate());
	pstmt.setString(7,bb2.getFile());

	// 4단계 sql 실행
	pstmt.executeUpdate();

} catch (Exception e) {
	e.printStackTrace();
}finally {
	
	// 예외 상관없이 마무리 작업(기억장소 정리)
	//pstmt의 기억공간이 있으면 close를 할 것
	if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
	if(con!=null) try{con.close();}catch(SQLException ex){}
}

	}

public void updateBoard2(BoardBean2 bb2) {
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	 
	try {
		con = getConnection();

		// 3단계 id 받아와서 그 외 정보 수정 즉 update

		String sql = "update board2 set subject=?,content=? where num=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, bb2.getSubject());
		pstmt.setString(2, bb2.getContent());
		pstmt.setInt(3, bb2.getNum());
		
		
		// 4단계 sql 실행
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
	
}


public BoardBean2 getContent(int num) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardBean2 bb2 = null;
	try {
		con = getConnection();
		String sql = "SELECT * FROM board where num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bb2 = new BoardBean2();
			bb2.setNum(rs.getInt("num"));
			bb2.setName(rs.getString("name"));
			bb2.setPass(rs.getString("pass"));
			bb2.setSubject(rs.getString("subject"));
			bb2.setContent(rs.getString("content"));
			bb2.setReadcount(rs.getInt("readcount"));
			bb2.setDate(rs.getDate("date"));
			bb2.setFile(rs.getString("file"));
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
	return bb2;
}



public int numPassCheck(BoardBean2 bb2) {
	int check = -1;
	Connection con=null;
    PreparedStatement pstmt=null;
	ResultSet rs=null;
	 
	try {
		con = getConnection();
	
		//System.out.println(bb.getNum());
		String sql = "select * from board2 where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bb2.getNum());

		// 4단계 rs=실행결과 저장
		rs = pstmt.executeQuery();

		// 5단계 첫행 rs 이동해서 데이터 있으면 아이디 있음
		// 비번 비교 맞으면 1 틀리면 0 없으면 아이디 없음 -1

		if (rs.next()) {
			if (bb2.getPass().equals(rs.getString("pass"))) {
				check = 1;

			} else {
				check = 0; // 비밀번호 틀림
			}
		} else {
			check = -1;
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
return check;

}


public void deleteBoard2(int num) {
	Connection con=null;
    PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 
	try {
		con = getConnection();
		
		String sql="delete from board2 where num=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,num);
		
		pstmt.executeUpdate(); 
		
		

	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		// 예외 상관없이 마무리 작업(기억장소 정리)
		//pstmt의 기억공간이 있으면 close를 할 것
		if(rs!=null) try {rs.close();}  catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex){}
	}
}


}
