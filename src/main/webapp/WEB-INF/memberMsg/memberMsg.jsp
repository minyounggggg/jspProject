<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberMsg.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	a {  
			text-decoration: none;
			color: inherit;
		}
		a:link{text-decoration: none;}
		a:visited, a:active{color: #212529;}
	    body{
    		font-family: "a영고딕M";
    	}
    	
    	#leftWindow{
    		font-family: "a영고딕M";
    		font-size : 18px;
    		float : left;
    		width : 25%;
    		text-align : center;
    		background-color : #eee;
    		padding : 50px 0 30px;
    		border-radius : 0 50px 50px 0;
    		margin-top : 50px;
    	}
    	#rightWindow{
    		font-family: "a영고딕M";
    		float : left;
    		width : 75%;
    		height: 100vh;
    		text-align : center;
    		background-color : #fff;
    		overflow : auto;
    		margin-top : 40px;
    	}
    	#footerTopMargin{
	    	clear : both;
	    	margin : 10px;
    	}
    	.title h3{
    		text-align : center;
    		font-size : 30px;
    	}
    	.title{
    		font-family: "a신디나루B";
    		background-color : #f1f1f1;
    		padding : 80px 0 50px;
    		color : #333;
    	}
    </style>
    <script>
    	'use strict';
    	
    	function memberMsgDeleteAll() {
			let ans = confirm("휴지통을 모두 비우시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url : "MemberMsgDeleteAll.msg",
				type : "post",
				success : function (res) {
					if(res != "0"){
						alert("휴지통의 모든 메세지가 삭제 되었습니다.")
						location.reload();
					}
					else alert("삭제 실패");
				},
				error : function () {
					alert("전송오류");
				}
			});
		}
    </script>
</head>
<body>
<div class="title">
	<h3 class="text-center">${sNickName}님의 편지함</h3>
</div>
<div id="leftWindow">
	<p><a href="MemberMsg.msg?mSw=0">메세지작성</a></p>
	<p><a href="MemberMsg.msg?mSw=1&mFlag=11">받은메세지</a></p>
	<p><a href="MemberMsg.msg?mSw=2">새메세지</a></p>
	<p><a href="MemberMsg.msg?mSw=3&mFlag=13">보낸메세지</a></p>
	<!-- <p><a href="MemberMsg.msg?mSw=4">수신확인</a></p> -->
	<p><a href="MemberMsg.msg?mSw=5&mFlag=15">휴지통</a></p>
	<p><a href="javascript:memberMsgDeleteAll()">휴지통비우기</a></p>
	<p><a href="${ctp}/MemberMain.mem" style="color : #ea4762"><b>메인으로 돌아가기</b></a></p>
</div>
<div id="rightWindow">
	<p>
		<c:if test="${mSw == 0}">
			<h3>메세지 작성</h3>
			<jsp:include page="memberMsgInput.jsp"/>
		</c:if>
		<c:if test="${mSw == 1}">
			<h3>받은 메세지</h3>
			<jsp:include page="memberMsgList.jsp"/>
		</c:if>
		<c:if test="${mSw == 2}">
			<h3>신규 메세지</h3>
			<jsp:include page="memberMsgList.jsp"/>
		</c:if>
		<c:if test="${mSw == 3}">
			<h3>보낸 메세지</h3>
			<jsp:include page="memberMsgList.jsp"/>
		</c:if>
		<c:if test="${mSw == 4}">
			<h3>수신 확인</h3>
			<jsp:include page="memberMsgList.jsp"/>
		</c:if>
		<c:if test="${mSw == 5}">
			<h3>휴지통 목록</h3>
			<jsp:include page="memberMsgList.jsp"/>
		</c:if>
		<c:if test="${mSw == 6}">
			<h3>메세지 내용보기</h3>
			<jsp:include page="memberMsgContent.jsp"/>
		</c:if>
	</p>
</div>
<br/>
<div id="footerTopMargin">&nbsp;</div>
<p><br/></p>
</body>
</html>