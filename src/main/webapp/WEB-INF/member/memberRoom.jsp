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
    	*{
		    box-sizing: border-box;
		    padding: 0;
		    margin: 0;
		}
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
    	.sec01_01{
    		background-image : url("${ctp}/images/memberRoom/room_bg01.jpg");
    		/* overflow:hidden; */
    		border-radius : 40px 0 0 40px;
    		display: flex;
			justify-content: center;
			align-items: center;
    		width : 30%;
    	}
    	/* 
    	.sec01_01 img{
    		width : 300px;
    		height : 300px;
    		border-radius : 200px;
    	}
    	 */
    	.sec01_01 .imgBox {
    		width:300px;
		    height:300px;
		    border-radius : 200px;
		    border : 8px solid #075663;
		    box-shadow : 8px 10px 10px rgba(0, 0, 50, 0.3);
		    overflow:hidden;
		    margin:0 auto;
    	}
    	.sec01_01 .imgBox img{
    		width:100%;
		    height:100%;
		    object-fit:cover;
    	}
    	.sec01_02{
    		width : 70%;
    		padding : 50px
    	}
    	.levelSec, .nickNameSec{
    		box-shadow : 8px 15px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 20px;
    		width : 50%;
    		padding : 15px;
    		margin : 0 auto;
    	}
    </style>
</head>
<body>
<div class="sec01">
	<div class="sec01_01">
		<section class="imgBox"><img src="${ctp}/images/member/${memVO.photo}"/></section>
			<!-- 회원 등급(등급별로 뱃지?달아주기?), 닉네임 표시 -->
		<section class="levelSec">
			<i class="fi fi-rr-user"></i>
			<p>${levelName}</p>
		</section>
		<section class="nickNameSec">
			<p>${sNickName}</p>
		</section>
			<!-- 회원 등급(등급별로 뱃지?달아주기?), 닉네임 표시 -->
	</div>
	<div class="sec01_02">
		<section><h2>로그인 완료 후 메인방</h2></section>
		<hr/>
		<section>
			<p>현재 <font color="blue"><b>${sNickName}(<font color="red">${levelName}</font>)</b></font>님이 로그인 상태 입니다.</p>
			<p>총 방문횟수 : <b>${mVo.visitCnt}</b>회</p>
			<p>오늘 방문횟수 : <b>${mVo.todayCnt}</b>회</p>
			<p>총 보유 포인트 : <b>${mVo.point}</b>점</p>
		</section>
		<hr/>
		<section>
			<h5>활동내역</h5>
			<p>방명록에 올린 글 수 : <b>${guestCnt}</b>건</p>
			<p>게시판에 올린 글 수 : __건</p>
			<p>자료실에 올린 글 수 : __건</p>
		</section>
	</div>
</div>
</body>
</html>