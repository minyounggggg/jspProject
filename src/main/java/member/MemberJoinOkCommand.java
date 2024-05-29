package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("images/member");
		int maxSize = 1024 * 1024 * 2;
		String encoding = "UTF-8";
		//String noImg = request.getServletContext().getRealPath("images/member/noimage.jpg");
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid")==null? "" : multipartRequest.getParameter("mid");
		String pwd = multipartRequest.getParameter("pwd")==null? "" : multipartRequest.getParameter("pwd");
		String nickName = multipartRequest.getParameter("nickName")==null? "" : multipartRequest.getParameter("nickName");
		String name = multipartRequest.getParameter("name")==null? "" : multipartRequest.getParameter("name");
		String gender = multipartRequest.getParameter("gender")==null? "" : multipartRequest.getParameter("gender");
		String birthday = multipartRequest.getParameter("birthday")==null? "" : multipartRequest.getParameter("birthday");
		String tel = multipartRequest.getParameter("tel")==null? "" : multipartRequest.getParameter("tel");
		String address = multipartRequest.getParameter("address")==null? "" : multipartRequest.getParameter("address");
		String email = multipartRequest.getParameter("email")==null? "" : multipartRequest.getParameter("email");
		String photo = multipartRequest.getFilesystemName("photo")==null? request.getContextPath()+"/images/member/noimage.jpg" : multipartRequest.getFilesystemName("photo");
		String content = multipartRequest.getParameter("content")==null? "" : multipartRequest.getParameter("content");
		String userInfor = multipartRequest.getParameter("userInfor")==null? "" : multipartRequest.getParameter("userInfor");
		
		
		// 아이디, 닉네임 백엔드 체크
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		dao = new MemberDAO();
		vo =dao.getMemberNickNameCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("message", "이미 사용중인 닉네임입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		//비밀번호 암호화(SHA256) - salt키를 만든 후 암호화 시켜준다.(uuid코드중 앞자리 8자리 같이 병행처리 후 암호화시킨다.)
		//UUID를 통한 salt키 만들기(앞에서 8자리를 가져왔다.)
		String salt = UUID.randomUUID().toString().substring(0,8);    //UUID를 변수에 담아서 비번에 더하기
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		pwd = salt + pwd;
		
		//
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOk(vo);
		if (res != 0) {
			request.setAttribute("message", "회원가입이 완료되었습니다.\\n다시 로그인해주세요.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원가입 실패\\n다시 가입해주세요.");
			request.setAttribute("url", "MemberJoin.mem");
		}
	}

}
