package friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fMessage.FMessageDAO;
import fMessage.FMessageVO;

public class FriendInputCommand implements FriendInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String friendMid = request.getParameter("friendMid")==null ? "" : request.getParameter("friendMid");
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("sNickName");
		
		FriendDAO dao = new FriendDAO();
		
		int res = dao.setFriendInput(mid, friendMid);
		
		response.getWriter().write(res + "");
		
		FMessageDAO mDao = new FMessageDAO();
		//FMessageVO vo = mDao.setFriendInputMsg();
		mDao.setFriendInputMsg(nickName, mid, friendMid);
		
	}

}
