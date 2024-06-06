<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
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
		a {  
			text-decoration: none;
			color: inherit;
		}
		a:link{text-decoration: none;}
		.genderSec a:visited, .logoutSec a:active{color: #212529;}
		.logoutSec a:visited, .logoutSec a:active{color: #f8f7e2;}
		p {margin : 0}
		button{
    		border: 0;
  			background-color: transparent;
    	}
    	body{
    		font-family: "a영고딕M";
    		/* background-image : url("${ctp}/images/memberMain/memberMain_bg01.jpg"); */
    		background-image : url("${ctp}/images/visual_bg_pc.png");
    		margin : 0 auto;
    		height: 100vh;
    		background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
    	}
    	.bg-opc{
    		background-color : rgba(255,255,255,0.5);
    		height: 100vh;
    	}
    	.bg-inner{
    		width: 1500px;
    		margin : 0 auto;
    	}
    	header{
    		padding-top : 60px;
    	}
    	header .top-menu{
    		display : flex;
    		justify-content : space-around;
    	}
    	header .top-menu button img{
    		display : flex;
    		justify-content : space-around;
    		width : 200px;
    	}
    	.sec01{
    		display : flex;
    		width : 1500px;
    		margin : 30px 0;
    		background-color : rgba(245,243,215,0.9);
    		border-radius : 50px;
    		border : 10px solid #19c8b9;
    		box-shadow : 8px 15px 10px rgba(0, 0, 50, 0.5);
    	}
    	.sec01-01{
    		background-image : url("${ctp}/images/memberRoom/room_bg01.jpg");
    		border-radius : 40px 0 0 40px;
    		width : 30%;
    		padding : 50px 65px;
    		box-shadow : 5px 0px 5px -2px rgba(0, 0, 50, 0.5);
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
    		padding : 30px 50px 30px;
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
    	.logoutSec{
    		clear : both;
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		background-color : #5d5d5d;
    		color : #f8f7e2;
    		text-align : center;
    		padding : 15px;
    		font-size : 22px;
    		margin-bottom : 5px;
    	}
    	.sec01-02 section{
    		float : left;
    		width : 50%;
    		margin : 0 auto;
    		padding : 10px;
    		text-align : center;
    	}
    	.sec01-02 button{
    		border: 0;
  			background-color: transparent;
    	}
    </style>
    <script>
    	'use strict';
    	
    	// 채팅내용 DB에 저장
    	function chatInput() {
			let chat = $("#chat").val();
			if(chat.trim() != "") {
				$.ajax({
					url : "MemberChatInput.mem",
					type : "post",
					data : {chat : chat},
					error : function () {
						alert("전송오류");
					}
				});
			}
		}
    	
    	// 채딩 대화입력후 엔터키를 누르면 자동으로 DB에 저장시키기 chatInput함수호출
    	$(function() {
			$("#chat").on("keydown", function(e) {
				if(e.keyCode == 13) chatInput();
			});
		});
    </script>
</head>
<body>
<div class="bg-opc">
<div class="bg-inner">
<header>
	<div class="top-menu">
		<button type="button" onclick="location.href='${ctp}/MemberMain.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_home01.png"/></button>
		<button type="button" onclick="#" class="m-0 p-0"><img src="${ctp}/images/topMenu/commingsoon_btn.png"/></button>
		<button type="button" onclick="#" class="m-0 p-0"><img src="${ctp}/images/topMenu/commingsoon_btn.png"/></button>
		<c:if test="${sLevel == 0}">
			<button type="button" onclick="#" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_admin01.png"/></button>
		</c:if>
		
	</div>
</header>
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
		<section class="logoutSec">
			<span style="font-family:a신디나루B"><a href="${ctp}/MemberLogout.mem">로그아웃</a></span>
		</section>
		<%-- 
		<section class="logoutSec">
			<button type="button" onclick="location.href='${ctp}/MemberLogout.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_logout01.png"/></button>
		</section>
		 --%>
	</div>
	<div class="sec01-02">
		<div>
			<section><button type="button" onclick="location.href='${ctp}/MemberAllList.mem';"><img src="${ctp}/images/memberMain/main_btn06.png"/></button></section>
			<c:if test="${fMsgCnt == 0}">
				<section><button type="button" onclick="location.href='${ctp}/FriendList.bf';"><img src="${ctp}/images/memberMain/main_btn03.png"/></button></section>
			</c:if>
			<c:if test="${fMsgCnt != 0}">
				<section><button type="button" onclick="location.href='${ctp}/FriendList.bf';"><img src="${ctp}/images/memberMain/main_btn12.gif"/></button></section>
			</c:if>
			<section><button type="button" onclick="location.href='${ctp}/PdsList.pds';"><img src="${ctp}/images/memberMain/main_btn07.png"/></button></section>
			<c:if test="${mMsgCnt == 0}">
				<section><button type="button" onclick="location.href='${ctp}/MemberMsg.msg';"><img src="${ctp}/images/memberMain/main_btn05.png"/></button></section>
			</c:if>
			<c:if test="${mMsgCnt != 0}">
				<section><button type="button" onclick="location.href='${ctp}/MemberMsg.msg';"><img src="${ctp}/images/memberMain/main_btn11.gif"/></button></section>
			</c:if>
			<!-- 
			<section>All-List</section>
			<section>F-List</section>
			<section>자료실</section>
			<section>게시판(QnA)</section>
			 -->
		</div>
		<div>
			<section class="sec-Chat" style="width:100%">
				<form name="chatForm">
					<label for="chat"><b></b></label>
					<iframe src="${ctp}/include/memberMessage.jsp" width="100%" height="200px" class="border"></iframe>
					<div class="input-group mt-1">
						<input type="text" name="chat" id="chat" class="form-control" placeholder="대화내용을 입력하세요" autofocus/>
						<div class="input-group-append">
							<input type="button" value="글등록" onclick="chatInput()" class="btn btn-primary"/> 
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>