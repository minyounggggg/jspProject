package friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FriendInputDeleteCommand implements FriendInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String friendMid = request.getParameter("friendMid")==null ? "" : request.getParameter("friendMid");
		
		FriendDAO dao = new FriendDAO();
		
		int res = dao.setFriendInputDelete(mid, friendMid);
		res = dao.setFriendInputMsgDelete(mid, friendMid);
		
		response.getWriter().write(res + "");
	}

}
