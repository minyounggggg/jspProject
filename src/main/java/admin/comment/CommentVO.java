package admin.comment;

public class CommentVO {
	// comment 테이블
	private int idx;
	private String part;
	private int partIdx;
	private String mid;
	private String nickName;
	private int star;
	private String cmtContent;
	private String cmtDate;
	
	// reviewReply 테이블의 필드정의
	private int replyIdx;
	// private int reviewIdx; 위에 review테이블의 idx랑 같음, 중복
	private String replyMid;
	private String replyNickName;
	private String replyDate;
	private String replyContent;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getPartIdx() {
		return partIdx;
	}
	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(String cmtDate) {
		this.cmtDate = cmtDate;
	}
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getReplyMid() {
		return replyMid;
	}
	public void setReplyMid(String replyMid) {
		this.replyMid = replyMid;
	}
	public String getReplyNickName() {
		return replyNickName;
	}
	public void setReplyNickName(String replyNickName) {
		this.replyNickName = replyNickName;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	
	@Override
	public String toString() {
		return "CommentVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", mid=" + mid + ", nickName="
				+ nickName + ", star=" + star + ", cmtContent=" + cmtContent + ", cmtDate=" + cmtDate + ", replyIdx="
				+ replyIdx + ", replyMid=" + replyMid + ", replyNickName=" + replyNickName + ", replyDate=" + replyDate
				+ ", replyContent=" + replyContent + "]";
	}
	
}
