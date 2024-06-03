package fMessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FMessageListCommand implements FMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String receiveId = (String) session.getAttribute("sMid");
		
		FMessageDAO dao = new FMessageDAO();
		
		ArrayList<FMessageVO> vos = dao.setFMessageList(receiveId); 
		
		request.setAttribute("vos", vos);
	}

}
