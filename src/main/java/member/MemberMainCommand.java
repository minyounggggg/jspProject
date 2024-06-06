package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fMessage.FMessageVO;
import memberMsg.MemberMsgVO;

public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO memDAO = new MemberDAO();
		MemberVO memVO = memDAO.getMemberIdCheck(mid);
		
		request.setAttribute("memVO", memVO);
		
		ArrayList<MemberMsgVO> mMsgVos = memDAO.getMemberMsg(mid);
		request.setAttribute("mMsgVos", mMsgVos);
		request.setAttribute("mMsgCnt", mMsgVos.size());
		
		ArrayList<FMessageVO> fMsgVos = memDAO.getFriendMsg(mid);
		request.setAttribute("fMsgVos", fMsgVos);
		request.setAttribute("fMsgCnt", fMsgVos.size());
	}

}
