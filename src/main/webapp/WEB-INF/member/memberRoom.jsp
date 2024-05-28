<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberRoom.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <link href="/your-path-to-uicons/css/uicons-[your-style].css" rel="stylesheet">
    <style>
    	*{
		    /* box-sizing: border-box; */
		    padding: 0;
		    margin: 0;
		}
		p {margin : 0}
    	body{
    		/* 
    		display: flex;
			justify-content: center;
			align-items: center;
			 */
    		font-family: "a영고딕M";
    		background-image : url("${ctp}/images/memberRoom/content_bg01.jpg");
    		/* background-image : url("${ctp}/images/bg_1.png"); */
    		/* 
    		height: 100vh;
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		     */
    	}
    	.sec01{
    		display : flex;
    		/* 
    		display : -webkit-flex;
    		display : -ms-flexbox;
    		height: 100vh;
    		 */
    		margin : 100px;
    		background-color : rgba(245,243,215,0.9);
    		border-radius : 50px;
    		border : 10px solid #19c8b9;
    		box-shadow : 8px 15px 10px rgba(0, 0, 50, 0.5);
    	}
    	/* 
    	.sec01 > div{
    		flex : 0 2:8 ;
    	}
    	 */
    	.sec01-01{
    		background-image : url("${ctp}/images/memberRoom/room_bg01.jpg");
    		/* overflow:hidden; */
    		border-radius : 40px 0 0 40px;
    		/* 
    		display: flex;
			justify-content: center;
			align-items: center;
			 */
    		width : 30%;
    		padding : 50px
    	}
    	/* 
    	.sec01_01 img{
    		width : 300px;
    		height : 300px;
    		border-radius : 200px;
    	}
    	 */
    	.sec01-01 .imgBox {
    		width:350px;
		    height:350px;
		    border-radius : 200px;
		    border : 8px solid #075663;
		    box-shadow : 8px 10px 10px rgba(0, 0, 50, 0.3);
		    overflow:hidden;
		    margin:0 auto;
    	}
    	.sec01-01 .imgBox img{
    		width:100%;
		    height:100%;
		    object-fit:cover;
    	}
    	.sec01-02{
    		width : 70%;
    		padding : 50px
    	}
    	.levelSec, .nickNameSec{
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		width : 50%;
    		padding : 15px;
    		float : left;
    		text-align : center;
    		background-color : rgba(245,243,215,0.9);
    		margin-top : 20px;
    		margin-bottom : 20px;
    		font-family : "a신디나루B";
    		font-size : 25px;
    	}
    	.genderSec{
    		/* overflow: hidden; */
    		clear : both;
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		background-color : rgba(245,243,215,0.9);
    		text-align : center;
    		padding : 15px;
    		font-size : 22px;
    		/* position : absolute; */
    	}
    	.sec01-02-01 section{
    		width : 30%;
    		
    	}
    </style>
</head>
<body>
<div class="sec01">
	<div class="sec01-01">
		<section class="imgBox"><img src="${ctp}/images/member/${memVO.photo}"/></section>
			<!-- 회원 등급(등급별로 아이콘?달아주기?, 등급 이름 뭐로하지,, 관리자, ), 닉네임 표시 -->
		<section class="levelSec">
			<p>${levelName}</p>
		</section>
		<section class="nickNameSec">
			<p>${sNickName}</p>
		</section>
		<section class="genderSec">
			<p>성별 | ${memVO.gender} | <img src="${ctp}/images/memberRoom/girl01.png"/></p>
		</section>
		<%-- 
		<section class="birthdaySec">
			<p>생일 <i class="fi fi-rr-cake-birthday"></i>${memVO.birthday}</p>
		</section>
		 --%>
	</div>
	<div class="sec01-02">
		<div class="sec01-02-01">
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ${sMid}</h2></section>
			<section><h2 style="font-family:a영고딕B; margin:0"><i class="fi fi-rr-circle-star"></i> ${sLevel}</h2></section>
			<section><h2 style="font-family:a영고딕B; margin:0"><i class="fi fi-br-circle-p"></i> ${memVO.point}</h2></section>
		</div>
		<hr/>
		<section>
			<p>가입일자 : <b>${memVO.startDate}</b></p>
			<p>TODAY : <b>${memVO.todayCnt}</b>회</p>
			<p>TOTAL : <b>${memVO.email}</b>회</p>
			<p>E-mail : <b>${memVO.point}</b></p>
			<%-- <p>좋아요 : <b>${memVO.good}</b></p> --%>
		</section>
		<hr/>
		<section>
			<h5>CONTENT</h5>
			<span style="background-color:#f1f1f1; padding:15px;">${memVO.content}</span>
			<textarea rows="5" class="form-control" id="content" name="content" placeholder="${memVO.content}" readonly></textarea>
		</section>
	</div>
</div>
</body>
</html>