package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memberMsg.MemberMsgVO;

public class MemberRoomCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO memDAO = new MemberDAO();
		MemberVO memVO = memDAO.getMemberIdCheck(mid);
		
		request.setAttribute("memVO", memVO);
		
		ArrayList<MemberMsgVO> mMsgVos = memDAO.getMemberMsg(mid);
		request.setAttribute("mMsgVos", mMsgVos);
		request.setAttribute("mMsgCnt", mMsgVos.size()); 		//신규메세지의 사이즈를 구해서 신규메세지가 있을경우만 리스트에 출력시키기위해
	}
}
