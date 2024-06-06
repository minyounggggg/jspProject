package admin;

	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.comment.CommentVO;
import common.GetConn;

	public class AdminDAO {
		private Connection conn = GetConn.getConn();
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		private String sql = "";
		
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
		
		// 리뷰를 작성했는지의 여부 체크
		public int getCommentSearch(CommentVO vo) {
			int res = 0;
			try {
				sql = "select * from comment where part=? and partIdx=? and mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getPart());
				pstmt.setInt(2, vo.getPartIdx());
				pstmt.setString(3, vo.getMid());
				rs = pstmt.executeQuery();
				if(rs.next()) res = 1;
			} catch (SQLException e) {
				System.out.println("SQL오류1 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return res;
		}

		
		// 리뷰작성 처리
		public int setCommentInputOk(CommentVO vo) {
			int res = 0;
			try {
				sql = "insert into comment values (default,?,?,?,?,?,?,default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getPart());
				pstmt.setInt(2, vo.getPartIdx());
				pstmt.setString(3, vo.getMid());
				pstmt.setString(4, vo.getNickName());
				pstmt.setInt(5, vo.getStar());
				pstmt.setString(6, vo.getCmtContent());
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류2 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}

		
		// 리뷰 내역 전체 리스트 가져오기
		public ArrayList<CommentVO> getReviewList(int idx, String part) {
			ArrayList<CommentVO> rVos = new ArrayList<CommentVO>();
			try {
//				sql = "select * from comment where part=? and partIdx=? order by idx desc";
				sql = "select * from (select * from comment where part=? and partIdx=?) as v left join commentReply r "
					+ "on v.partIdx=? and v.idx=r.reviewIdx order by v.idx desc, r.replyIdx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, idx);
				pstmt.setInt(3, idx);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CommentVO vo = new CommentVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setPart(rs.getString("part"));
					vo.setPartIdx(rs.getInt("partIdx"));
					vo.setMid(rs.getString("mid"));
					vo.setNickName(rs.getString("nickName"));
					vo.setStar(rs.getInt("star"));
					vo.setCmtContent(rs.getString("cmtContent"));
					vo.setCmtDate(rs.getString("cmtDate"));
					
					vo.setReplyIdx(rs.getInt("replyIdx"));
					vo.setReplyMid(rs.getString("replyMid"));
					vo.setReplyNickName(rs.getString("replyNickName"));
					vo.setReplyContent(rs.getString("replyContent"));
					
					rVos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL오류33 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return rVos;
		}

		
		// 리뷰삭제
		public int setCommentDelete(int idx) {
			int res = 0;
			try {
				sql = "delete from comment where idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류3 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}

		
		// 리뷰 대댓글저장하기
		public int setCommentReplyInputOk(CommentVO vo) {
			int res = 0;
			try {
				sql = "insert into commentReply values (default,?,?,?,default,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getIdx());
				pstmt.setString(2, vo.getReplyMid());
				pstmt.setString(3, vo.getReplyNickName());
				pstmt.setString(4, vo.getReplyContent());
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류4 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}
}
