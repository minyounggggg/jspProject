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
    		margin-top : 50px;
    	}
    	header .top-menu{
    		display : flex;
    		justify-content : space-around;
    	}
    	header .top-menu button img{
    		display : flex;
    		justify-content : space-around;
    		width : 200px
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
</head>
<body>
<header>
	<div class="top-menu">
		<button type="button" onclick="location.href='${ctp}/MemberMain.mem';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_home01.png"/></button>
		<button type="button" onclick="location.href='${ctp}/PdsList.pds';" class="m-0 p-0"><img src="${ctp}/images/topMenu/topmenu_btn_pds01.png"/></button>
		<button type="button" onclick="#" class="m-0 p-0"><img src="${ctp}/images/topMenu/commingsoon_btn.png"/></button>
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
				<img src="${ctp}/images/memberRoom/update_Icon01.png" style="width:45px; margin-right:50px;"/>정보 수정하기
			</button>
		</section>
	</div>
	<div class="sec01-02">
		<div class="sec01-02-01">
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ${sMid}</h2></section>
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> Lv. ${sLevel}</h2></section>
			<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ${memVO.point} p</h2></section>
		</div>
		<div class="sec01-02-02">
		<hr/>
			<section class="sec-I">
				<p><b>가입일자</b> : ${memVO.startDate.substring(0,10)}</p>
				<p><b>TODAY</b> : ${memVO.todayCnt} 회</p>
				<p><b>TOTAL</b> : ${memVO.visitCnt} 회</p>
				<p><b>E-mail</b> : ${memVO.email}</p>
				<p><b>좋아요</b> : ${memVO.heart}</p>
			</section>
			<section class="sec-C">
				<div class="col text-left">
				    <b>신규 메세지(<font color='red'><b>${mMsgCnt}</b></font>건)</b>
				    <span style="font-size:11px">...<a href="MemberMsg.msg">more</a></span>
			      	<c:if test="${mMsgCnt != 0}">
					    <table class="table table-bordered table-hover text-center">
					      <tr class="table-dark text-dark">
					        <th>번호</th>
					        <th>아이디</th>
					        <th>보낸날짜</th>
					      </tr>
						  <c:forEach var="vo" items="${mMsgVos}" varStatus="st">
						  	<c:if test="${st.count <= 3}">
								<tr>
							    	<td>${st.count}</td>
							        <td>${vo.sendId}</td>
							        <td>${fn:substring(vo.sendDate,0,16)}</td>
							    </tr>
						    </c:if>
						  </c:forEach>
						  <tr>
						  	<td colspan="3" class="m-0 p-0"></td>
						  </tr>
					    </table>
			      	</c:if>
				</div>
			</section>
		</div>
		<section class="sec01-02-03">
		<hr/>
			<h5 style="font-family:a신디나루B">CONTENT</h5>
			<textarea rows="5" class="form-control" id="content" name="content" placeholder="${fn:replace(memVO.content,newline,'<br/>')}" readonly></textarea>
		</section>
		<hr/>
		<section class="text-right">
			<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberDelete.mem';">탈퇴하기</button>
		</section>
	</div>
</div>
</body>
</html>