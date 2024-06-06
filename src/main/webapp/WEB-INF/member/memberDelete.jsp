<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberRoom.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	*{
		    /* box-sizing: border-box; */
		    padding: 0;
		    margin: 0;
		}
		button{
    		border: 0;
  			background-color: transparent;
    	}
		p {margin : 0}
    	body{
    		width: 1500px;
    		font-family: "a영고딕M";
    		background-image : url("${ctp}/images/memberRoom/content_bg01.jpg");
    		margin : 0 auto;
    	}
    	header{
    		margin-top : 30px;
    	}
    	header .top-menu{
    		display : flex;
    		justify-content : space-around;
    	}
    	header .top-menu button img{
    		display : flex;
    		justify-content : space-around;
    		width : 250px
    	}
    	.sec01{
    		display : flex;
    		/* 
    		align-items: center;
    		 */
    		width : 1500px;
    		margin : 20px 0;
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
    		margin-top : 10px;
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
    		margin-bottom : 5px;
    	}
    	.updateBtn{
    		float : left;
    		font-family : "a신디나루B";
    		font-size : 20px;
    		box-shadow : 5px 5px 10px rgba(0, 0, 50, 0.5);
    		border-radius : 50px;
    		background-color : rgba(245,243,215,0.9);
    		padding : 10px;
    		margin-bottom : 5px;
    		width : 100%;
    	}
    	.sec01-02-01{
			display: flex;
			align-items: center;    	
    	}
    	.sec01-02-01 section{
    		width : 30%;
    		float : left;
    	}
    	.sec-I, .sec-C{
    		float : left;
    		width : 50%;
    		margin-bottom : 20px;
    	}
    	.sec01-02-03{
    		clear : both;
    	}
    </style>
    <script>
    	'use strict';
    	
    	function pwdDeleteCheck() {
			let pwd = $("#pwd").val().trim();
			if(pwd == ""){
				alert("비밀번호를 입력하세요!");
				$("#pwd").focus();
			}
			else {
				let ans = confirm("회원탈퇴 하시겠습니까?");
				if(ans) {
					ans = confirm("회원탈퇴 하시면 1개월간 같은 아이디로 가입하실 수 없습니다.\n계속 진행하시겠습니까?");
					if(ans) myform.submit();
				}
			}
		}
    	
    </script>
</head>
<body>
<header>
	<div class="top-menu">
		<button type="button" onclick="location.href='${ctp}/MemberMain.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_home01.png"/></button>
		<button type="button" onclick="location.href='${ctp}/PdsList.pds';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_pds01.png"/></button>
		<button type="button" onclick="location.href='${ctp}/MemberMyRoom.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_myroom01.png"/></button>
		<c:if test="${slevel == 0}">
			<button type="button" onclick="location.href='${ctp}/Admin.ad';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_admin01.png"/></button>
		</c:if>
		<button type="button" onclick="location.href='${ctp}/MemberLogout.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_logout01.png"/></button>
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
			<p>${memVO.nickName}</p>
		</section>
		<section class="genderSec">
			<p>
				<span style="font-family:a신디나루B">성별</span> &nbsp; | &nbsp; 
				<span style="font-size:20px">${memVO.gender}</span> &nbsp; | &nbsp; 
				<c:if test="${memVO.gender == '남자'}"><img src="${ctp}/images/memberRoom/boy01.png" style="width:30px"/></c:if>
				<c:if test="${memVO.gender == '여자'}"><img src="${ctp}/images/memberRoom/girl01.png" style="width:30px"/></c:if>
			</p>
		</section>
		<section class="birthdaySec">
			<p><img src="${ctp}/images/memberRoom/birthday_Icon01.png" style="width:45px; margin-right:50px;"/>${memVO.birthday.substring(0,10)}</p>
		</section>
		<section class="updateBtn">
			<button onclick="location.href='${ctp}/MemberUpdate.mem';">
				<img src="${ctp}/images/memberRoom/birthday_Icon01.png" style="width:45px; margin-right:50px;"/>정보 수정하기
			</button>
		</section>
	</div>
	<div class="sec01-02">
		<div class="sec01-02-01">
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ${sMid}</h2></section>
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> Lv. ${sLevel}</h2></section>
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ${memVO.point} p</h2></section>
		</div>
		<div class="sec01-02-02" >
		<section class="text-center" style="margin : 50px">
			<img src="${ctp}/images/delete.png"/>
		</section>
			<form name="myform" method="post" action="MemberDeleteCheckOk.mem">
				<hr/>
				<section class="text-center pb-3">
					<p>회원 탈퇴를 위한 비밀번호 확인</p>
					<input type="password" name="pwd" id="pwd" class="form-control mt-3" autofocus required/>
				</section>
				<section class="text-center">
					<input type="button" value="탈퇴하기" onclick="pwdDeleteCheck()" class="btn btn-primary mr-2"/>
					<input type="reset" value="다시입력" class="btn btn-info mr-2"/>
				</section>
				<hr/>
			</form>
		</div>
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberMain.mem';">메인으로 돌아가기</button>
	</div>
</div>

<!-- The Modal -->
  <div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원 탈퇴 신청</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          회원탈퇴 하시면 1개월간 같은 아이디로 가입하실 수 없습니다.\\n계속 진행하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- The Modal -->
  
</body>
</html>