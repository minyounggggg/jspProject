<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- certification -->

<%
	String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
	if(mid.equals("")){
		out.println("<script>");
		out.println("alert('로그인 후 사용하세요');");
		out.println("location.href = '"+request.getContextPath()+"/WEB-INF/member/memberLogin.jsp';");
		out.println("</script>");
	}
%>