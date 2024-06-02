<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberMain.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	*{
		    /* box-sizing: border-box; */
		    padding: 0;
		    margin: 0;
		}
		p {margin : 0}
    	body{
    		font-family: "a영고딕M";
    		background-image : url("${ctp}/images/bg_1.png");
    		display : flex;
    		align-items: center;
    		justify-content: center;
    	}
    	.sec01{
    		display : flex;
    		width : 1500px;
    		margin : 100px 0;
    		background-color : #f0f8ff;
    	}
    	.sec01-01{
    		/* background-image : url("${ctp}/images/memberRoom/room_bg01.jpg"); */
    		width : 30%;
    		padding : 50px 65px;
    		/* box-shadow : 5px 0px 5px -2px rgba(0, 0, 50, 0.5); */
    	}
    	.sec01-01 .imgBox {
    		width:300px;
		    height:300px;
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
    		padding : 50px;
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
    		margin-bottom : 30px;
    		font-family : "a신디나루B";
    		font-size : 25px;
    	}
    	.genderSec{
    		clear : both;
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		background-color : rgba(245,243,215,0.9);
    		text-align : center;
    		padding : 15px;
    		font-size : 22px;
    		margin-bottom : 5px;
    	}
    	.birthdaySec{
    		clear : both;
    		display: flex;
			align-items: center;
    		font-family : "a신디나루B";
    		font-size : 20px;
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		background-color : rgba(245,243,215,0.9);
    		text-align : center;
    		padding : 10px;
    	}
    	.sec01-02 section{
    		background-color : #f1f1f1;
    		float : left;
    		width : 50%;
    		margin : 0 auto;
    		padding : 30px;
    		text-align : center;
    	}
    	.sec01-02 button{
    		border: 0;
  			background-color: transparent;
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
			<span style="font-family:a신디나루B"><a href="${ctp}/MemberRoom.mem">내 정보 보기</a></span>
		</section>
	</div>
	<div class="sec01-02">
		<section><button type="button" onclick="location.href='${ctp}/MemberAllList.mem';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<section><button type="button" onclick="location.href='${ctp}/MemberFList.mem';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<section><button type="button" onclick="location.href='${ctp}/PdsList.pds';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<section><button type="button" onclick="location.href='${ctp}/MemberAllList.mem';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<section><button type="button" onclick="location.href='${ctp}/MemberAllList.mem';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<section><button type="button" onclick="location.href='${ctp}/MemberAllList.mem';"><img src="${ctp}/images/memberRoom/birthday_Icon01.png"/></button></section>
		<!-- 
		<section>All-List</section>
		<section>F-List</section>
		<section>방명록</section>
		<section>게시판</section>
		<section>MENU</section>
		<section>MENU</section>
		 -->
	</div>
</div>
</body>
</html>