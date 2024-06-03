package friend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberVO;

public class FriendListCommand implements FriendInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String mid = request.getParameter("sMid")==null ? "" : request.getParameter("sMid");
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		FriendDAO dao = new FriendDAO();
		
		ArrayList<MemberVO> vos = dao.getFriendList(mid);
		
		request.setAttribute("vos", vos);
		
	}

}
