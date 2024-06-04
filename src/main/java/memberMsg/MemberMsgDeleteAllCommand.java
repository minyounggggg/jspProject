package memberMsg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMsgDeleteAllCommand implements MemberMsgInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberMsgDAO dao = new MemberMsgDAO();
		
		int res = dao.MemberMsgDeleteAll(mid);
		
		response.getWriter().write(res + "");
	}

}
