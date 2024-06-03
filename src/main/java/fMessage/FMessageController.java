package fMessage;

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
public class FMessageController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FMessageInterface command = null;
		String viewPage = "/WEB-INF/fMessage";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevle")==null? 999 : (int)session.getAttribute("sLevel");
		
		if(com.equals("/FMessageList")){
			command = new FMessageListCommand();
			command.execute(request, response);
			viewPage += "/fMessageList.jsp";
		}
//		else if(com.equals("/FriendInputCheck")){
//			command = new FriendInputCheckCommand();
//			command.execute(request, response);
//			return;
//		}
		
//		else if(com.equals("/MemberJoin")){
//			viewPage += "/memberJoin.jsp";
//		}
//		else if(level > 4) {
//			request.setAttribute("message", "로그인 후 사용하세요");
//			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
//			viewPage = "/include/message.jsp";
//		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
