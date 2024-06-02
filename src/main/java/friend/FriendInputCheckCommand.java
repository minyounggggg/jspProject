package friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FriendInputCheckCommand implements FriendInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String friendMid = request.getParameter("friendMid")==null ? "" : request.getParameter("friendMid");
		
		FriendDAO fdao = new FriendDAO();
		FriendVO fvo = fdao.getFriendInputCheck(mid,friendMid);
		
		request.setAttribute("fvo", fvo);
		System.out.println("fvo : " + fvo);
		System.out.println("fvo Accept : " + fvo.getAccept());
	}

}
