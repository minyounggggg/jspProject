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
    <script>
    	'use strict';
    	
    	function profile(mid,nickName,gender,birthday,email,photo,content,level,startDate,lastDate,todayCnt,heart,levelName,) {
			$("#myModal #modalNick").text(mid);
			$("#myModal #modalMid").text(nickName);
			$("#myModal #modalGender").text(gender);
			$("#myModal #modalBirthday").text(birthday);
			$("#myModal #modalEmail").text(email);
			$("#myModal #modalPhoto").text(photo);
			$("#myModal #modalContent").text(content);
			$("#myModal #modalLevel").text(level);
			$("#myModal #modalStartDate").text(startDate);
			$("#myModal #modalLastDate").text(lastDate);
			$("#myModal #modalTodayCnt").text(todayCnt);
			$("#myModal #modalHeart").text(heart);
			$("#myModal #modalLevelName").text('${levelName}');
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
					<td>${vo.level}</td>
					<td>${fn:substring(vo.lastDate,0,16)}</td>
					<td>
						<input type="button" value="프로필보기" 
						onclick="profile('${vo.mid}','${vo.nickName}','${vo.gender}','${vo.birthday}',
						'${vo.email}','${vo.photo}','${vo.content}','${vo.level}','${vo.startDate}',
						'${vo.lastDate}','${vo.todayCnt}','${vo.heart}','${levelName}',)" 
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
	</div>
</div>

<!-- 댓글수정 모달창 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><span id="modalNick"></span>님의 프로필</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          고유번호 : <span id="modalMid"></span><br/>
          고유번호 : <span id="modalGender"></span><br/>
          고유번호 : <span id="modalBirthday"></span><br/>
          고유번호 : <span id="modalEmail"></span><br/>
          고유번호 : <span id="modalPhoto"></span><br/>
          고유번호 : <span id="modalContent"></span><br/>
          고유번호 : <span id="modalLevel"></span><br/>
          고유번호 : <span id="modalStartDate"></span><br/>
          고유번호 : <span id="modalLastDate"></span><br/>
          고유번호 : <span id="modalTodayCnt"></span><br/>
          고유번호 : <span id="modalHeart"></span><br/>
          고유번호 : <span id="modalLevelName"></span><br/>
          
          <input type="hidden" name="idx" id="idx"/>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!-- 댓글수정 모달창 -->

</body>
</html>