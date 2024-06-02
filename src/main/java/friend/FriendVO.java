package friend;

public class FriendVO {
	private int idx;
	private String mid;
	private String friendMid;
	private String accept;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getFriendMid() {
		return friendMid;
	}
	public void setFriendMid(String friendMid) {
		this.friendMid = friendMid;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	
	@Override
	public String toString() {
		return "FriendVO [idx=" + idx + ", mid=" + mid + ", friendMid=" + friendMid + ", accept=" + accept + "]";
	}
	
}
