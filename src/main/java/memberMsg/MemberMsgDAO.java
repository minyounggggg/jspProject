package memberMsg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberMsgDAO {
	
	//GetConn getConn = GetConn.getInstance();
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private MemberMsgVO vo = null;
	
	
	
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

	
	// 메세지 전체 리스트보기
	public ArrayList<MemberMsgVO> getMessageList(String mid, int mSw) {
		ArrayList<MemberMsgVO> vos = new ArrayList<MemberMsgVO>();
		try {
			if(mSw == 1 ) {	// 받은 메세지(처음에는 전체메세지(새메세지+읽은메세지)
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where receiveId=? and (receiveSw='n' or receiveSw='r') order by idx desc";
			}
			else if(mSw == 2 ) {	// 신규메세지
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where receiveId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 3 ) {	// 보낸메세지
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where sendId=? and sendSw='s' order by idx desc";
			}
			else if(mSw == 4 ) {	// 보낸메세지
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where sendId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 5 ) {	// 휴지통
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where (receiveId=? and receiveSw='g') or (sendId=? and sendSw='g') order by idx desc";
			}
			else {	// mSW가 0(메세지작성), 6(내용보기)
				return vos;
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			if(mSw == 5) {
				pstmt.setString(2, mid);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberMsgVO();
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
			System.out.println("SQL오류1 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	
	// 메세지 작성처리
	public int setMemberMsgInputOk(MemberMsgVO vo) {
		int res = 0;
		try {
			sql = "insert into memberMsg values (default,?,?,?,default,default,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getSendId());
			pstmt.setString(4, vo.getReceiveId());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류2 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 한건의 메세지 내용보기
	public MemberMsgVO getMemberMsgContent(int idx, int mFlag) {
		MemberMsgVO vo = new MemberMsgVO();
		try {
			if(mFlag == 11) {	// 받은 메세지에서 신규메세지 클릭하면 n을 r로 변경하기
				sql = "update memberMsg set receiveSw='r', receiveDate=now() where idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.executeUpdate();
				pstmtClose(); 	// 이중쿼리를 사용할땐 이렇게 닫고서 다시 선언하여 사용하기
			}
			sql = "select * from memberMsg where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setSendId(rs.getString("sendId"));
			vo.setSendSw(rs.getString("sendSw"));
			vo.setSendDate(rs.getString("sendDate"));
			vo.setReceiveId(rs.getString("receiveId"));
			vo.setReceiveSw(rs.getString("receiveSw"));
			vo.setReceiveDate(rs.getString("receiveDate"));
		} catch (SQLException e) {
			System.out.println("SQL오류3 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	
	// 메세지 휴지통으로 이동
	public int MemberMsgDeleteCheck(int idx, int mSw) {
		int res = 0;
		try {
			if(mSw == 11) {		// mSw(=mFlag)값이 11은 받은편지함에서 휴지통으로 보낸경우
				sql = "update memberMsg set receiveSw='g' where idx=?";
			}
			else {
				sql = "update memberMsg set sendSw='x' where idx=?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류4 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	// 휴지통에 들어있는 모든 자료들을 삭제(update) 처리한다. 이때 receiveSw와 sendSw가 모두 'x'이면 실제 자료를 삭제(delete)처리한다.
	public int MemberMsgDeleteAll(String mid) {
		int res = 0;
		try {
			// 받은 메세지에서의 휴지통처리에 수행할 sql문
			sql = "update memberMsg set receiveSw='x' where receiveId=? and receiveSw='g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			
			// 보낸 메세지에서의 휴지통처리에 수행할 sql문
			sql = "update memberMsg set sendSw='x' where sendId=? and sendSw='g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from memberMsg where sendSw = 'x' and receiveSw = 'x'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL오류5 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	


	
}
