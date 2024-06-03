package friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class FriendDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	FriendVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {}
			finally {
				pstmtClose();
			}
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}

	
	//============================================================
	
	
	// 친구신청 처리
	public int setFriendInput(String mid, String friendMid) {
		int res = 0;
		try {
			sql = "insert into friend values (default, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, friendMid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류1 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 친구신청 유무 확인
	public FriendVO getFriendInputCheck(String mid, String friendMid) {
		FriendVO vo = new FriendVO();
		try {
			sql = "select * from friend where mid=? and friendMid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, friendMid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setFriendMid(rs.getString("friendMid"));
				vo.setAccept(rs.getString("accept"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류2 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	
	// 친구신청 취소
	public int setFriendInputCancel(String mid, String friendMid) {
		int res = 0;
		try {
			sql = "delete from friend where mid=? and friendMid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, friendMid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류3 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 친구 리스트
	public ArrayList<MemberVO> getFriendList(String mid) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select members.* from members, friend WHERE friend.mid=? AND friend.friendMid=members.mid AND friend.accept='OK'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setHeart(rs.getInt("heart"));
				
				if(vo.getLevel() == 0) vo.setStrLevel("운영자");
				else if(vo.getLevel() == 1) vo.setStrLevel("주민");
				else if(vo.getLevel() == 2) vo.setStrLevel("섬대표");
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류44 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	

	
}
