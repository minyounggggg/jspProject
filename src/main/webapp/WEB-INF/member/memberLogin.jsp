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
    	body{
    		display: flex;
			justify-content: center;
			align-items: center;
    		font-family: "Jua", sans-serif;
    		background-image : url("<%=request.getContextPath() %>/images/visual_bg_pc.png");
    		<%-- background-image : url("<%=request.getContextPath() %>/images/bg_1.png"); --%>
    		height: 100vh;
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
    	}
    	.sec1{
    		width : 500px;
    		/* height : 500px; */
    		background-color : rgba(245,243,215,0.8);
    		border-radius : 20px;
    		padding : 30px
    	}
    	.loginBtn{
    		background: url("${ctp}/images/loginBtn2.png") no-repeat;
	        border: none;
	        width: 400px;
	        height: 50px;
	        cursor: pointer;
    	}
    	.btnSec{
			text-align: center;
    	}
    	button{
    		border: 0;
  			background-color: transparent;
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
<div class="sec1">
	<form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">
		<p class="text-center"><img src="${ctp}/images/logo2.png" class="mb-2"></p>
	    <table class="table table-borderless text-left">
	      	<tr>
	        	<th>아이디</th>
	        	<td><input type="text" name="mid" value="${mid}" autofocus required class="form-control"/></td>
	      	</tr>
	      	<tr>
	      		<td></td>
	        	<td><input type="checkbox" name="idSave" checked /> 아이디 저장</td>
	      	</tr>
	      	<tr>
		        <th>비밀번호</th>
		        <td><input type="password" name="pwd" value="1234" required class="form-control"/></td>
		    </tr>
		    <%-- 
	      	<tr>
		        <td colspan="2">
		          	<input type="submit" value="로그인" class="btn btn-success mr-2"/>
			        <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
			        <input type="button" value="회원가입" onclick="location.href='${ctp}/MemberJoin.mem';" class="btn btn-primary mr-4"/>
		        </td>
	      	</tr>
	      	 --%>
	    </table>
	    <div class="btnSec">
		    <button type="submit"><img src="${ctp}/images/loginBtn2.png" class="mb-2"></button><br/>
		    <button type="button" onclick="location.href='${ctp}/MemberJoin.mem';"><img src="${ctp}/images/loginBtn2.png"/></button>
	    </div>
  	</form>
</div>
</body>
</html>