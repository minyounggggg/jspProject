package fMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class FMessageDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	FMessageVO vo = null;
	
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
	
	
	// 상대방에게 친구신청 메세지 전송 처리
	public void setFriendInputMsg(String nickName, String mid, String friendMid) {
		try {
			sql = "insert into fMessage values (default, '"+nickName+"님의 친구신청', '"+nickName+"님의 친구신청이 도착하였습니다.\n수락 하시겠습니까?', ?, default, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, friendMid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류1 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	
	// 친구신청 리스트
	public ArrayList<FMessageVO> setFMessageList(String receiveId) {
		ArrayList<FMessageVO> vo = new ArrayList<FMessageVO>();
		try {
			sql = "select * from fMessage where receiveId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiveId);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("SQL오류2 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	

	
}
