<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberRoom.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	body{
    		<%-- background-image : url("<%=request.getContextPath() %>/images/visual_bg_pc.png"); --%>
    		background-image : url("<%=request.getContextPath() %>/images/bg_1.png");
    	}
    </style>
</head>
<body>
<div class="container">
	<h2>로그인 완료 후 메인방</h2>
</div>
</body>
</html>