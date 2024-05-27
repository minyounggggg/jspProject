<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberLogin.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap');
    	.jua-regular {
		  font-family: "Jua", sans-serif;
		  font-weight: 400;
		  font-style: normal;
		}
    	@font-face {
	    font-family: 'Freesentation-9Black';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
		*{
		    box-sizing: border-box;
		    padding: 0;
		    margin: 0;
		}
    	body{
    		display: flex;
			justify-content: center;
			align-items: center;
    		font-family: "Jua", sans-serif;
    		background-image : url("${ctp}/images/visual_bg_pc.png");
    		/* background-image : url("${ctp}/images/bg_1.png"); */
    		height: 100vh;
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
    	}
    	.sec01{
    		width : 500px;
    		/* height : 500px; */
    		background-color : rgba(245,243,215,0.9);
    		border-radius : 50px;
    		border : 10px solid #19c8b9;
    		box-shadow : 8px 15px 10px rgba(0, 0, 50, 0.5);
    		padding : 40px 50px 50px;
    	}
    	
    	.loginBtn{
    		background: url("${ctp}/images/loginBtn2.png") no-repeat;
	        border: none;
	        width: 400px;
	        height: 50px;
	        cursor: pointer;
    	}
    	/* .btnSec{
			text-align: center;
    	} */
    	button{
    		border: 0;
  			background-color: transparent;
    	}
    	.btnSec img{
    		width: 380px;
			object-fit: cover;
    	}
    	
    </style>
    <script>
    	'use strict';
    	
    	jQuery(function($) {
    	    $("body").css("display", "none");
    	    $("body").fadeIn(1000);
    	    $("a.transition").click(function(e){
    	        e.preventDefault();
    	        linkLocation = this.href;
    	        $("body").fadeOut(1000, redirectPage);
    	    });
    	    function redirectPage() {
    	    window.location = linkLocation;
    	    }
    	});
    </script>
</head>
<body>
<div class="sec01">
	<form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">
		<!-- <h2 class="text-center mb-5">L O G I N</h2> -->
		<div class="text-center mb-5"><img src="${ctp}/images/logo03.png" class="logo" style="width:300px"></div>
    	<input type="text" name="mid" value="atom" placeholder="User ID" autofocus required class="form-control mb-1" style="height:45px"/>
       	<input type="checkbox" name="idSave" checked class="mb-3 ml-2"/> 아이디 저장
	    <input type="password" name="pwd" value="1234" placeholder="Password" required class="form-control mb-4" style="height:45px"/>
	    <div class="btnSec">
		    <button type="submit" class="mb-2 p-0"><img src="${ctp}/images/login_btn_03.png"></button>
		    <button type="button" onclick="location.href='${ctp}/MemberJoin.mem';" class="m-0 p-0"><img src="${ctp}/images/join_btn_03.png"/></button>
	    </div>
  	</form>
</div>
</body>
</html>