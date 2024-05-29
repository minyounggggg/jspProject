package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOKCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		if(vo.getPwd() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("message", "입력하신 회원정보가 존재하지않습니다.\\n확인하고 다시 로그인 해주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		String salt = vo.getPwd().substring(0, 8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "아이디 또는 비밀번호를 잘못 입력했습니다.\\n확인하고 다시 로그인 해주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		// 로그인 체크 완료후에 처리할 내용.. (쿠키/세션/..)
		// 회원일때 처리할 부분
		// 1. 방문포인트 지급: 매번 10포인트씩지급, 단 1일 최대 50포인트까지만 지급.
		// 2-1. 최종접속일처리, 방문카운트(일일방문카운트, 전체누적방문카운트)
		// 2-2. 준회원을 자동으로 정회원 등업처리
		// 3. 처리 완료된자료(vo)를 DB에 업데이트해준다.
		
		String levelName = "";
		if(vo.getLevel() == 0) levelName = "관리자";
		else if(vo.getLevel() == 1) levelName = "정회원";
		else if(vo.getLevel() == 2) levelName = "우수회원";
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("levelName", levelName);
		
		request.setAttribute("message", mid+"님 로그인되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
	}

}
