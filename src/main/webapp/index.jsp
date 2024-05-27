<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	*{
		    box-sizing: border-box;
		    padding: 0;
		    margin: 0;
		}
    	body{
    		font-family: "a신디나루B";
    		/* background-image : url("${ctp}/images/visual_bg_pc.png"); */
    		background-image : url("<%=request.getContextPath() %>/images/bg_1.png");
    		height: 100vh;
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
    	}
    </style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>프로젝트 준비</h2>
	<input type="button" value="시작하기" onclick="location.href='${ctp}/MemberLogin.mem';" class="btn btn-success mr-2"/>
</div>
<p><br/></p>
</body>
</html>