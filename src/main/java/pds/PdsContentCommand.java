package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.comment.CommentVO;

public class PdsContentCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null? 0 : Integer.parseInt(request.getParameter("pag"));
		int pagSize = request.getParameter("pagSize")==null? 0 : Integer.parseInt(request.getParameter("pagSize"));
		String part = request.getParameter("part")==null? "" : request.getParameter("part");
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getPdsIdxSearch(idx);
		
		//해당글의 리뷰내용 가져오기
		AdminDAO aDao = new AdminDAO();
		ArrayList<CommentVO> rVos = aDao.getReviewList(idx, "pds");
		//System.out.println("rVos : " + rVos);
		
		// 별점 평균 구하기
		int reviewTot = 0;
		for(CommentVO r : rVos) {
			reviewTot += r.getStar();
		}
		double reviewAvg = 0.0;
		if(rVos.size() != 0) reviewAvg = (double)reviewTot / rVos.size();
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pagSize", pagSize);
		request.setAttribute("part", part);
		request.setAttribute("rVos", rVos);
		request.setAttribute("reviewAvg", reviewAvg);
	}

}
