package admin.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class CommentInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")==null? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		int star = request.getParameter("star")==null? 0 : Integer.parseInt(request.getParameter("star"));
		String cmtContent = request.getParameter("cmtContent")==null? "" : request.getParameter("cmtContent");
		
		CommentVO vo = new CommentVO();
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setCmtContent(cmtContent);
		//System.out.println("vo : " + vo);
		
		AdminDAO dao = new AdminDAO();
		
		String str = "";
		int res = 0;
		res = dao.getCommentSearch(vo);
		if(res != 0) str = "현재 게시물에 이미 리뷰작성을 하셨습니다.";
		else {
			res = dao.setCommentInputOk(vo);
			if(res != 0) str = "리뷰작성 완료";
			else str = "리뷰작성 실패";
		}
		
		response.getWriter().write(str);
	}

}
