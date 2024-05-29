package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberAllListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getMemberAllList();
		
		MemberVO mVo = dao.getMemberIdCheck(mid);
		
		request.setAttribute("vos", vos);
		request.setAttribute("mVo", mVo);
		
		String listlevelName = "";
		if(mVo.getLevel() == 0) listlevelName = "관리자";
		else if(mVo.getLevel() == 1) listlevelName = "정회원";
		else if(mVo.getLevel() == 2) listlevelName = "우수회원";
		
		request.setAttribute("listlevelName", listlevelName);
		
	}

}
