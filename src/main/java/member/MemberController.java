package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null? 999 : (int)session.getAttribute("sLevel");
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")){
			command = new MemberLoginOKCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberJoin")){
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")){
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberIdCheck")){
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberNickNameCheck")){
			command = new MemberNickNameCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberLogout")){
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(level > 4) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberRoom")){
			command = new MemberRoomCommand();
			command.execute(request, response);
			viewPage += "/memberRoom.jsp";
		}
		else if(com.equals("/MemberMain")){
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberUpdate")){
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}
		else if(com.equals("/MemberUpdateOk")){
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberAllList")){
			command = new MemberAllListCommand();
			command.execute(request, response);
			viewPage += "/memberAllList.jsp";
		}
		else if(com.equals("/MemberChatInput")){
			command = new MemberChatInputCommand();
			command.execute(request, response);
			viewPage += "/memberAllList.jsp";
		}
		else if(com.equals("/MemberDelete")){
			command = new MemberDeleteCommand();
			command.execute(request, response);
			viewPage += "/memberDelete.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")){
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
