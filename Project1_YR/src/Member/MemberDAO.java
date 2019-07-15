package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class MemberDAO {
	
//디비연결 메서드() getConnection()
// 외부에서 접근하지 않고 내부에서만 접근
	private Connection getConnection() throws Exception{
				
		Context init=new InitialContext(); 
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/mysqlDB"); //java:comp/env/는 위치 jdbc/mysqlDB는 이름
		Connection con=ds.getConnection();
			return con;
			}
	
	
	public void insertMember(MemberBean mb) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
	try {

		con = getConnection();
		
		// 3단계 연결정보 이용해 sql 만들고 실행할 객체 생성(preparestatement라는 자바에서 제공하는 sql 생성해주는 내장객체
		// java sql 사용) // id pass name email address phone mobile 파라미터값 가져오기(자바파일mb에)
		String sql = "insert into member(id,pass, name,email,address,phone,mobile,reg_date,file) values(?,?,?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPass());
		pstmt.setString(3, mb.getName());
		pstmt.setString(4, mb.getEmail());
		pstmt.setString(5, mb.getAddress());
		pstmt.setString(6, mb.getPhone());
		pstmt.setString(7, mb.getMobile());
		pstmt.setTimestamp(8, mb.getReg_date());
		pstmt.setString(9, mb.getFile());

		
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
	public MemberBean updateMember(MemberBean mb) {
		Connection con=null;
        PreparedStatement pstmt=null;
		ResultSet rs=null;
		 
		try {
			con = getConnection();

			// 3단계 id 받아와서 그 외 정보 수정 즉 update
String sql = "update member set name=?, file=?, address=?, email=?, pass=?, mobile=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getFile());
			pstmt.setString(3, mb.getAddress());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getPass());
			pstmt.setString(6, mb.getMobile());
			pstmt.setString(7, mb.getId());
			
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
		return mb;
	}
	
	public void deleteMember(String id) {
		Connection con=null;
        PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		try {
			con = getConnection();
			
			String sql_2="delete from member where id=? ";
			PreparedStatement pstmt_2=con.prepareStatement(sql_2);
			pstmt_2.setString(1,id);
			
			pstmt_2.executeUpdate(); 
			
			// 4단계 sql 실행
			pstmt_2.executeUpdate();

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
	
	
	public MemberBean getMember(String id) {
		Connection con=null;
        PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberBean mb=null; // member Bean이라는 주소값을 담을 변수 선언 String id;와 같음, 초기화 시키려고 null
		
		try {
			con = getConnection();
			// 3단계 sql id 조건 만족하면 member 정보 가져오기
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			// 4단계 rs=실행결과 저장
			rs = pstmt.executeQuery();

			// 5단계 rs 첫 행 이동 데이터 있으면 mb객체 생성
			// setID(rs에서 가져온 id값)저장

			if (rs.next()) {
				mb = new MemberBean();
				// 주소값을 통해서 MemberBean안의 값들에 접근하기 위해 mb 객체 생성
				mb.setId(rs.getString("id"));
				// rs에서 가져온 id열
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
				mb.setFile(rs.getString("file"));				
				// 날짜는 TimeStamp형인데 String형이라고 써서 틀림
			}

			// 이 mb는 주소값, 실제 기억 장소는 따로 있음

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
		return mb;
	}
	
	
	//userCheck후 값을 int로 return 받을 메서드 만들기
		public int userCheck(String id, String pass) {
			int check = -1;
			Connection con=null;
	        PreparedStatement pstmt=null;
			ResultSet rs=null;
			 
			try {
				con = getConnection();
			
				// 3단계 sql id 조건 만족하면 member 정보 가져오기
				String sql = "select * from member where id=?";
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
		
		//idCheck후 id 중복값 확인하기
				public int idCheck(String id) {
					int check = 0;
					Connection con=null;
			        PreparedStatement pstmt=null;
					ResultSet rs=null;
					 
					try {
						con = getConnection();
					
						// 3단계 sql id 조건 만족하면 member 정보 가져오기
						String sql = "select * from member where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);

						// 4단계 rs=실행결과 저장
						rs = pstmt.executeQuery();

						// 5단계 첫행 rs 이동해서 데이터 있으면 아이디 있음
						// 비번 비교 맞으면 1 틀리면 0 없으면 아이디 없음 -1

						if (rs.next() == true) {							
								check = 1; //id 중복

							} else {
								check = 0; // id 사용가능
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
	
}
