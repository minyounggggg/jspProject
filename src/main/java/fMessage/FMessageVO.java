package fMessage;

public class FMessageVO {
	private int idx;
	private String title;
	private String content;
	private String sendId;
	private String sendDate;
	private String receiveId;
	private String receiveSw;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getReceiveSw() {
		return receiveSw;
	}
	public void setReceiveSw(String receiveSw) {
		this.receiveSw = receiveSw;
	}
	
	@Override
	public String toString() {
		return "FMessageVO [idx=" + idx + ", title=" + title + ", content=" + content + ", sendId=" + sendId
				+ ", sendDate=" + sendDate + ", receiveId=" + receiveId + ", receiveSw=" + receiveSw + "]";
	}
	
}
