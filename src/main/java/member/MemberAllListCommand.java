package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import friend.FriendDAO;
import friend.FriendVO;

public class MemberAllListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getMemberAllList(mid);
		
		//MemberVO mVo = dao.getMemberIdCheck(mid);
		
		request.setAttribute("vos", vos);
		//System.out.println("vos : " + vos);
		//request.setAttribute("mVo", mVo);
		
//		FriendDAO fdao = new FriendDAO();
//		FriendVO fvo = fdao.getFriendInputCheck(mid);
		
//		request.setAttribute("fvo", fvo);
//		System.out.println("fvo : " + fvo);
	}

}
