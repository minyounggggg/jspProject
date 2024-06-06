package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import fMessage.FMessageVO;
import memberMsg.MemberMsgVO;

public class MemberDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	
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
	
	
	// 아이디 중복체크, 로그인시 아이디 체크
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from members where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}
		} catch (SQLException e) {
			System.out.println("SQL오류1 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	
	// 닉네임중복체크
	public MemberVO getMemberNickNameCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from members where nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}
		} catch (SQLException e) {
			System.out.println("SQL오류2 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	
	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into members value (default,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getPhoto());
			pstmt.setString(11, vo.getContent());
			pstmt.setString(12, vo.getUserInfor());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류3 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 멤버 전체리스트
	public ArrayList<MemberVO> getMemberAllList(String mid) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select m.*, f.accept from members m left join friend f on f.mid=? and f.friendMid=m.mid where m.userDel='NO' order by idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
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
				
				vo.setAccept(rs.getString("accept"));
				
				if(vo.getLevel() == 0) vo.setStrLevel("운영자");
				else if(vo.getLevel() == 1) vo.setStrLevel("주민");
				else if(vo.getLevel() == 2) vo.setStrLevel("섬대표");
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류4 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	
	// 회원정보수정
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update members set nickName=?, name=?, gender=?, birthday=?, tel=?, address=?, email=?, photo=?, content=?, userInfor=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getPhoto());
			pstmt.setString(9, vo.getContent());
			pstmt.setString(10, vo.getUserInfor());
			pstmt.setString(11, vo.getMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류5 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 채팅내용 DB에 저장하기
		public void setMemberChatInputOk(String nickName, String chat) {
			try {
				sql = "insert into memberchat values (default, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
				pstmt.setString(2, chat);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류7 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
		}
		
		// 채팅내용 DB에서 읽어오기
		public ArrayList<MemberChatVO> getMemberMessage() {
			ArrayList<MemberChatVO> vos = new ArrayList<MemberChatVO>();
			try {
				sql = "select m.* from (select * from memberChat order by idx desc limit 50) m order by idx;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberChatVO vo = new MemberChatVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setNickName(rs.getString("nickName"));
					vo.setChat(rs.getString("chat"));
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL오류7 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return vos;
		}

		// 메인에 신규메세지 mini view 에 목록 불러오기
		public ArrayList<MemberMsgVO> getMemberMsg(String mid) {
			ArrayList<MemberMsgVO> vos = new ArrayList<MemberMsgVO>();
			try {
				sql = "select *, timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where receiveId=? and receiveSw='n' order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberMsgVO vo = new MemberMsgVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setSendId(rs.getString("sendId"));
					vo.setSendSw(rs.getString("sendSw"));
					vo.setSendDate(rs.getString("sendDate"));
					vo.setReceiveId(rs.getString("receiveId"));
					vo.setReceiveSw(rs.getString("receiveSw"));
					vo.setReceiveDate(rs.getString("receiveDate"));
					vo.setHour_diff(rs.getInt("hour_diff"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL오류8 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}

		// 로그인시에 업데이트될 내용 처리
		public void setLoginUpdate(MemberVO vo) {
			try {
				sql = "update members set point=?, lastDate=now(), visitCnt=visitCnt+1, todayCnt=? where mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,	vo.getPoint());
				pstmt.setInt(2, vo.getTodayCnt());
				pstmt.setString(3, vo.getMid());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류9 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
		}

		
		//회원 탈퇴신청
		public int setMemberDeleteUpdate(String mid) {
			int res = 0;
			try {
				sql = "update members set userDel = 'OK', level=99 where mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류10 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
			
		}

		
		// 친구신청 메세지
		public ArrayList<FMessageVO> getFriendMsg(String mid) {
			ArrayList<FMessageVO> vos = new ArrayList<FMessageVO>();
			try {
				sql = "select * from fMessage where receiveId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					FMessageVO vo = new FMessageVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setSendId(rs.getString("sendId"));
					vo.setReceiveId(rs.getString("receiveId"));
					vo.setReceiveSw(rs.getString("receiveSw"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL오류9 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}

	
	
}
