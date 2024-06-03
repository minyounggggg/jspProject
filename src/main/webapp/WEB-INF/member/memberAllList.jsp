<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    	#myModal{
    		background-color: rgba(0,0,0,0.3);
    	}
    	.modal-content{
    		background-color: transparent;
    		border: none;
    	}
    	.modal-dialog {
	        max-width: 1500px;
	    }
	    .modal-header{
	    	border-bottom: none;
	    	margin-bottom: 10px;
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
    </style>
    <script>
    	'use strict';
    	
    	function profile(mid,nickName,gender,birthday,email,photo,content,level,startDate,lastDate,todayCnt,heart,listlevelName,accept) {
    		let img = "${ctp}/images/member/"+photo;
			$("#myModal #modalPhoto").attr("src",img);
			$("#myModal #modalNick").text(nickName);
			$("#myModal #modalMid").text(mid);
			$("#myModal #modalGender").text(gender);
			$("#myModal #modalBirthday").text(birthday.substring(0,10));
			$("#myModal #modalEmail").text(email);
			$("#myModal #modalContent").text(content);
			$("#myModal #modalLevel").text(level);
			$("#myModal #modalStartDate").text(startDate.substring(0,10));
			$("#myModal #modalLastDate").text(lastDate.substring(0,16));
			$("#myModal #modalTodayCnt").text(todayCnt);
			$("#myModal #modalHeart").text(heart);
			$("#myModal #modalLevelName").text(listlevelName);
			let str = '';
			if(accept == 'NO') {
				str += '<button type="button" onclick="friendInputCancel()" class="m-0 p-0">';
				str += '<img src="${ctp}/images/memberAllList/friend_cancel_btn01.png" style="width:100%"/>';
				str += '</button>';
			}
			else if (accept == 'OK') {
				str += '<button type="button" onclick="friendInput()" class="m-0 p-0">';
				str += '<img src="${ctp}/images/memberAllList/friend_delete_btn01.png" style="width:100%"/>';
				str += '</button>';
			}
			else {
				str += '<button type="button" onclick="friendInput()" class="m-0 p-0">';
				str += '<img src="${ctp}/images/memberAllList/friend_input_btn01.png" style="width:100%"/>';
				str += '</button>';
			}
			$("#myModal #modalAccept").html(str);
			/* 
			let friendMid = $("#modalMid").text();
    		let query = {
    				mid : "${sMid}",
    				friendMid : friendMid
    		}
			$.ajax({
				url : "FriendInputCheck.bf",
				type : "get",
				data : query,
				//success : 
				error : function () {
					alert("전송오류");
				}
			});
    		 */
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
    	
    </script>
</head>
<body>
<div class="container">
	<div id="totalList">
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>닉네임</th>
				<th>회원등급</th>
				<th>마지막접속일</th>
				<th>프로필보기</th>
				<th>아이디</th>
				<th>최종방문일</th>
				<c:if test="${sLevel == 0}">
					<th>오늘방문횟수</th>
					<th>활동여부</th>
				</c:if>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<c:if test="${vo.userInfor == '공개' || (vo.userInfor != '공개' && sLevel == 0)}">
				<c:if test="${vo.userDel == 'OK'}"><c:set var="active" value="탈퇴신청" /></c:if>
				<c:if test="${vo.userDel != 'OK'}"><c:set var="active" value="활동중" /></c:if>
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.nickName}</td>
					<td>${vo.strLevel}</td>
					<td>${fn:substring(vo.lastDate,0,16)}</td>
					<td>
						<input type="button" value="프로필보기" 
						onclick="profile('${vo.mid}','${vo.nickName}','${vo.gender}','${vo.birthday}',
						'${vo.email}','${vo.photo}','${vo.content}','${vo.level}','${vo.startDate}',
						'${vo.lastDate}','${vo.todayCnt}','${vo.heart}','${vo.strLevel}','${vo.accept}')" 
						data-toggle="modal" data-target="#myModal" class="secondary"/>
					</td>
					<td><a href="MemberSearch.mem?mid=${vo.mid}">${vo.mid}</a></td>
					<td>${vo.gender}</td>
					<c:if test="${sLevel == 0}">
						<td>${vo.todayCnt}</td>
						<td>
							<c:if test="${vo.userDel == 'OK'}"><font color="red"><b>${active}</b></font></c:if>
							<c:if test="${vo.userDel != 'OK'}">${active}</c:if>
						</td>
					</c:if>
				</tr>
				</c:if>
			</c:forEach>
			<tr><td colspan="9" class="m-0 p-0"></td></tr>
		</table>
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberMain.mem';">돌아가기</button>
	</div>
</div>

<!-- 모달창 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="sec01">
			<div class="sec01-01">
				<%-- <section class="imgBox"><img src="${ctp}/images/member/${mVo.photo}"/></section> --%>
				<div class="imgBox"><img id="modalPhoto"/></div>
					<!-- 회원 등급(등급별로 아이콘?달아주기?, 등급 이름 뭐로하지,, 관리자, ), 닉네임 표시 -->
				<section class="levelSec">
					<span id="modalLevelName"></span>
				</section>
				<section class="nickNameSec">
					<span id="modalNick"></span>
				</section>
				<section class="genderSec">
					<p>
						<span style="font-family:a신디나루B">성별</span> &nbsp; | &nbsp; 
						<span id="modalGender" style="font-size:20px"></span> &nbsp; | &nbsp; 
						<img src="${ctp}/images/memberRoom/boy01.png" style="width:30px"/>
					</p>
				</section>
				<section class="birthdaySec">
					<p><img src="${ctp}/images/memberRoom/birthday_Icon01.png" style="width:45px; margin-right:50px"/><span id="modalBirthday"></span></p>
				</section>
			</div>
			<div class="sec01-02">
				<div class="sec01-02-01">
					<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> <span id="modalMid"></span></h2></section>
					<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> Lv.<span id="modalLevel"></span></h2></section>
					<section><h2 style="font-family:a신디나루B; margin:0"><img src="${ctp}/images/memberRoom/idLogo01.png"/> ♥ <span id="modalLevel"></span></h2></section>
					<%-- 
					<c:if test="${fvo.accept != 'NO'}">==${fvo.accept}::
						<section>
							<button type="button" onclick="friendInput()" class="m-0 p-0">
							<img src="${ctp}/images/memberAllList/friend_input_btn01.png" style="width:100%"/>
							</button>
						</section>
					</c:if>
					<c:if test="${fvo.accept == 'NO'}">
						<section>
							<button type="button" onclick="friendInputCancel()" class="m-0 p-0">
							<img src="${ctp}/images/memberAllList/friend_cancel_btn01.png" style="width:100%"/>
							</button>
						</section>
					</c:if>
					 --%>
					 <section id="modalAccept"></section>
				</div>
				<section class="sec01-02-02">
				<hr/>
					<p><b>가입일자</b> : <span id="modalStartDate"></span></p>
					<p><b>TODAY</b> : <span id="modalTodayCnt"></span> 회</p>
					<p><b>TOTAL</b> : <span id="modalTodayCnt"></span> 회</p>
					<p><b>E-mail</b> : <span id="modalEmail"></span></p>
					<p><b>좋아요</b> : <span id="modalHeart"></span></p>
				</section>
				<hr/>
					<h5 style="font-family:a신디나루B">CONTENT</h5>
				<section class="sec01-02-03">
					<span id="modalContent"></span>
					<%-- <textarea rows="5" class="form-control" id="content" name="content" placeholder="${memVO.content}" readonly></textarea> --%>
				</section>
			</div>
			<!-- <input type="hidden" name="idx" id="idx"/> -->
			<input type="hidden" name="mid" value="${sMid}" />
		</div>
        
        <!-- Modal footer -->
        <!-- 
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
         -->
      </div>
    </div>
  </div>
<!-- 모달창 끝 -->

</body>
</html>