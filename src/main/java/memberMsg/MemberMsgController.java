package memberMsg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.msg")
public class MemberMsgController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberMsgInterface command = null;
		String viewPage = "/WEB-INF/memberMsg";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		//인증처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMsg")) {
			command = new MemberMsgCommand();
			command.execute(request, response);
			viewPage += "/memberMsg.jsp";
		}
		else if(com.equals("/MemberMsgInputOk")) {
			command = new MemberMsgInputCommandOk();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMsgDeleteCheck")) {
			command = new MemberMsgDeleteCheckCommandOk();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMsgDeleteOne")) {
			command = new MemberMsgDeleteOneCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberMsgDeleteAll")) {
			command = new MemberMsgDeleteAllCommand();
			command.execute(request, response);
			return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
