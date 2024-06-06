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
		button{
    		border: 0;
  			background-color: transparent;
    	}
    	body{
    		font-family: "a신디나루B";
    		background-image : url("${ctp}/images/in_bg.jpg");
    		height: 100vh;
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    display: flex;
  justify-content: center;
  align-items: center;
    	}
    	#bt img {
    		width : 500px;
    		transition: all 0.2s linear;
    	}
    	#bt:hover img {
  			transform: scale(1.1);
		}
    </style>
</head>
<body>
	<button type="button" onclick="location.href='${ctp}/MemberLogin.mem';" class="m-0 p-0" id="bt"><img src="${ctp}/images/start_btn.png"/></button>
</body>
</html>