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
	<title>memberAllList.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	*{
		    box-sizing: border-box;
		    padding: 0;
		    margin: 0;
		}
		p {margin : 0}
		button{
    		border: 0;
  			background-color: transparent;
    	}
	    body{
    		font-family: "a영고딕M";
    		/* background-image : url("${ctp}/images/memberAllList/bg01.jpg"); */
    		background-color: rgba(0,0,0,0.3);
    		background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
    	}
	    button.close{
	    	background-color: #fff;
	    	border-radius: 100px;
	    }
    	.sec01{
    		display : flex;
    		/* align-items: center; */
    		width : 1500px;
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
    	}
    	.sec01-02-01{
			display: flex;
			align-items: center;    	
    	}
    	.sec01-02-01 section{
    		width : 25%;
    		float : left;
    	}
    	.sec01-02-02{
    		clear : both;
    	}
    	section.sec01-02-03{
    		background-color: #f1f1f1;
		    padding: 20px;
		    height: 30%;
    	}
    	#fMessageBtn {
		  position: fixed;
		  right: 1rem;
		  transition: 0.7s ease;
		}
    </style>
    <script>
    	'use strict';
    	
    	function fMessageContent(content,sendId) {
			$("#myModal #modalContent").html(content);
			$("#myModal #modalSendId").text(sendId);
		}
    	
    	// 친구신청 처리
    	function friendInput() {
    		let friendMid = $("#modalMid").text();
    		let query = {
    				mid : "${sMid}",
    				friendMid : friendMid
    		}
			$.ajax({
				url : "FriendInput.bf",
				type : "get",
				data : query,
				success : function (res) {
					if(res != "0") {
						alert("친구신청이 완료되었습니다.");
						//location.reload();
					}
					else {
						alert("친구신청 실패, 다시 시도해주세요.");
						return false;
					}
				},
				error : function () {
					alert("전송오류");
				}
			});
		}
    	
    	//친구신청 취소 처리
    	function friendInputCancel() {
    		let ans = confirm("친구신청을 취소하시겠습니까?");
    		if(!ans) return false;
    		
    		let friendMid = $("#modalMid").text();
    		let query = {
    				mid : "${sMid}",
    				friendMid : friendMid
    		}
			$.ajax({
				url : "FriendInputCancel.bf",
				type : "get",
				data : query,
				success : function (res) {
					if(res != "0") {
						alert("친구신청이 취소되었습니다.");
						//location.reload();
					}
					else {
						alert("친구신청 취소 실패, 다시 시도해주세요.");
						return false;
					}
				},
				error : function () {
					alert("전송오류");
				}
			});
		}
    	
    	// 신청 수락 버튼 처리
    	function friendInput() {
    		let friendMid = $("#modalSendId").text();
    		let query = {
    				mid : "${sMid}",
    				friendMid : friendMid
    		}
			$.ajax({
				url : "FriendInputOK.bf",
				type : "post",
				data : query,
				success : function (res) {
					if(res != "0"){
						alert("친구신청이 수락되었습니다.");
						location.reload();
					}
					else {
						alert("친구신청 수락이 누락되었습니다.\n다시 시도해주세요.");
						return false;
					}
				},
				error : function () {
					alert("전송오류");
				}
			});
		}
    	
    	// 신청 거절 버튼 처리
    	function friendInputDelete() {
    		let friendMid = $("#modalSendId").text();
    		let query = {
    				mid : "${sMid}",
    				friendMid : friendMid
    		}
			$.ajax({
				url : "FriendInputDelete.bf",
				type : "post",
				data : query,
				success : function (res) {
					if(res != "0"){
						alert("친구신청이 거절되었습니다.");
						location.reload();
					}
					else {
						alert("친구신청 거절이 누락되었습니다.\n다시 시도해주세요.");
						return false;
					}
				},
				error : function () {
					alert("전송오류");
				}
			});
		}
    	
    </script>
</head>
<body>
<div class="container">
	<div id="totalList">
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>제목</th>
				<th>보낸날짜</th>
				<th>-</th>
				<th>-</th>
				<th>-</th>
				<th>-</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<%-- 
					<c:if test="${vo.userInfor == '공개' || (vo.userInfor != '공개' && sLevel == 0)}">
						<c:if test="${vo.userDel == 'OK'}"><c:set var="active" value="탈퇴신청" /></c:if>
						<c:if test="${vo.userDel != 'OK'}"><c:set var="active" value="활동중" /></c:if>
				--%>
				<tr>
					<td>${vo.idx}</td>
					<td><a href="#" onclick="fMessageContent('${fn:replace(vo.content,newline,'</br>')}','${vo.sendId}')" data-toggle="modal" data-target="#myModal">${vo.title}</a></td>
					<td>${fn:substring(vo.sendDate,0,16)}</td>
					<td>-</td>
							<%-- 
							<td>
								<input type="button" value="프로필보기" 
								onclick="profile('${vo.mid}','${vo.nickName}','${vo.gender}','${vo.birthday}',
								'${vo.email}','${vo.photo}','${vo.content}','${vo.level}','${vo.startDate}',
								'${vo.lastDate}','${vo.todayCnt}','${vo.heart}','${vo.strLevel}')" 
								data-toggle="modal" data-target="#myModal" class="secondary"/>
							</td>
							 --%>
					<td>-</td>
						<%-- <td><a href="MemberSearch.mem?mid=${vo.mid}">${vo.mid}</a></td> --%>
					<td>-</td>
					<td>-</td>
							<%-- 
							<c:if test="${sLevel == 0}">
								<td>${vo.todayCnt}</td>
								<td>
									<c:if test="${vo.userDel == 'OK'}"><font color="red"><b>${active}</b></font></c:if>
									<c:if test="${vo.userDel != 'OK'}">${active}</c:if>
								</td>
							</c:if>
							 --%>
				</tr>
					<%-- 
					</c:if>
					<input type="hidden" name="sMid" value="${sMid}" />
					--%>
			</c:forEach>
			<tr><td colspan="9" class="m-0 p-0"></td></tr>
		</table>
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberMain.mem';">돌아가기</button>
	</div>
</div>

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">${sMid}님의 친구신청 리스트</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <span id="modalContent"></span>
          <input type="hidden" id="modalSendId" name="modalSendId"/>
          <hr/>
          <input type="button" value="수락" onclick="friendInput()" class="btn btn-success"/>
          <input type="button" value="거절" onclick="friendInputDelete()" class="btn btn-warning"/>
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