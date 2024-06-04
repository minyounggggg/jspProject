package memberMsg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMsgDeleteOneCommand implements MemberMsgInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int mFlag = request.getParameter("mFlag")==null ? 0 : Integer.parseInt(request.getParameter("mFlag"));
		
		MemberMsgDAO dao = new MemberMsgDAO();
		
		int res = dao.MemberMsgDeleteCheck(idx, mFlag);
		
		response.getWriter().write(res + "");
	}

}
