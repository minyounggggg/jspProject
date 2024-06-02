<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberUpdate.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/woo.js"></script>
    <style>
    	
    	body{
    		font-family: "a영고딕L";
    		display: flex;
			justify-content: center;
			align-items: center;
    		background-image : url("${ctp}/images/visual_bg_pc.png");
    		/* background-image : url("${ctp}/images/bg_1.png"); */
    		/* height: 100vh; */
		    background-size: cover;
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    padding : 100px 0;
    	}
    	.sec01{
    		width : 1000px;
    		/* height : 500px; */
    		background-color : rgba(245,243,215,0.9);
    		border-radius : 50px;
    		border : 10px solid #19c8b9;
    		box-shadow : 8px 15px 10px rgba(0, 0, 50, 0.5);
    		padding : 50px;
    	}
    </style>
    <script>
    	'use strict';
    	
    	// 화면전환 애니메이션 (fadeIn, fadeOut) 
    	jQuery(function($) {
    	    $("body").css("display", "none");
    	    $("body").fadeIn(1000);
    	    $("a.transition").click(function(e){
    	        e.preventDefault();
    	        linkLocation = this.href;
    	        $("body").fadeIn(1000, redirectPage);
    	    });
    	    function redirectPage() {
    	    window.location = linkLocation;
    	    }
    	});
    	
    	
	    let nickCheckBtn = 1;
	    
    	function fCheck() {
    		// 유효성 검사하기
    		
    		// 유효성 검사.....
	    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
	    	
	    	// 최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자
	    	//let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    	
	    	
	    	
	    	
	    	// 정규식을 이용한 유효성검사처리..
	    	
	    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원 가입처리한다.
			let email1 = myform.email1.value.trim();
    		let email2 = myform.email2.value;
			let email = email1 + email2;
			
			let tel1 = myform.tel1.value;
	    	let tel2 = myform.tel2.value.trim();
	    	let tel3 = myform.tel3.value.trim();
	    	let tel = tel1 + "-" + tel2 + "-" + tel3;
	    	
	    	let postcode = myform.postcode.value + " ";
	    	let roadAddress = myform.roadAddress.value + " ";
	    	let detailAddress = myform.detailAddress.value + " ";
	    	let extraAddress = myform.extraAddress.value + " ";
	    	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
	    	
	    	// 이메일 주소형식체크
	        //-----------------------------------------------------------
	        // 전화번호 형식 체크
	        /* 
	        if(tel2 != "" && tel3 != ""){
	        	// 전화번호 정규화 체크
	        }
	        else {
	        	tel2 = " ";
	        	tel3 = " ";
	        	tel = tel1 + "-" + tel2 + "-" + tel3;
	        }
	    	 */
	    	 //-----------------------------------------------------------
	    	// 정규식, 유효성
	    	/* 
	    	if(!regMid.test(mid)){
	    		alert("영문 대소문자와 숫자의 8~16자 조합으로 입력해주세요.")
	    	}
	    	else if(!regPwd.test(pwd)){
	    		alert("최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자를 입력해주세요.");
	    		myform.pwd.focus();
	    		return false;
	    	}
	    	 */
	    	//-----------------------------------------------------------
	    	// 사진파일 업로드
	    	let photo = document.getElementById("file").value;
	    	if(photo.trim != ""){
	    		let ext = photo.substring(photo.lastIndexOf(".")+1).toLowerCase();
	    		let maxSize = 1024 * 1024 * 2;
	    		let fileSize = document.getElementById("file").files[0].size;
	    		
	    		if(ext != "jpg" && ext != "png" && ext != "gif"){
	    			alert("사진 파일은 'jpg, png, gif'만 가능합니다.");
	    			return false;
	    		}
	    		else if(fileSize > maxSize){
	    			alert("업로드 가능한 파일의 최대용량은 2MByte입니다.");
	    			return false;
	    		}
	    	}
	    	//else return false;
	    	
	    	// 닉네임 중복 체크버튼
	    	let nickName = myform.nickName.value;
			if(nickCheckBtn == 0){
				alert("닉네임 중복 체크를 해주세요.");
				document.getElementById("nickNameBtn").focus();
			}
	    	/* 
			else if(nickName == '${sNickName}') {
				nickCheckBtn = 1;
			}
	    	 */
			else{
	    		myform.email.value = email;
	    		myform.tel.value = tel;
	    		myform.address.value = address;
	    		
	    		myform.submit();
	    	}
		}
    	
    	// 닉네임 중복체크
        function nickCheck() {
    		let nickName = myform.nickName.value;
    		if(nickName.trim() == ""){
    			alert("닉네임을 입력해주세요.");
    			myform.nickName.focus();
    		}
    		else if(nickName == '${sNickName}'){
    			alert("현재 닉네임을 그대로 사용합니다.");
    			nickCheckBtn = 1;
    			return false;
    		}	
    		else {
    			nickCheckBtn = 1;
				$.ajax({
					url : "MemberNickNameCheck.mem",
					type : "get",
					data : {nickName : nickName},
					success : function (res) {
						if(res != '0'){
							alert("이미 사용중인 닉네임입니다.");
							myform.nickName.focus();
						}
						else {
							alert("사용가능한 닉네임입니다.");
						}
					},
					error : function () {
						alert("전송오류");
					}
				});
    		}	
		}
		
    	// 아이디, 닉네임 다시 고쳤을 경우 다시 중복버튼 체크하게 유도
    	
    	$(function(){
        	$("#nickName").on("blur", () => {
        		nickCheckBtn = 0;
        	});
        });
    	 
    	// 사진파일 미리보기
    	function imgCheck(e) {
			if(e.files && e.files[0]){
				let reader = new FileReader();
				reader.onload = function (e) {
					document.getElementById("demoImg").src = e.target.result;
				}
				reader.readAsDataURL(e.files[0]);
			}
		}
    	
    	
    </script>
</head>
<body>
<div class="sec01">
	<section>
		<form name="myform" method="post" action="${ctp}/MemberUpdateOk.mem" enctype="multipart/form-data" class="was-validated"><!-- enctype="multipart/form-data" -->
	    <h2 style="font-family: a신디나루B; color:#075663;">회원정보 수정</h2>
	    <p style="font-family: a영고딕B; color: #708090;">정보수정 중 문제 발생시 고객센터로 문의주시기 바랍니다.</p>
	    <hr/>
	    <div class="form-group">아이디
		  <input type="text" class="form-control" value="${sMid}" name="mid" id="mid" readonly/>
	    </div>
	    <div class="form-group">
	      <label for="nickName">닉네임 <span style="color:#DB4455"><b>*</b></span></label>
	      <div class="input-group mb-1">
		      <input type="text" class="form-control" value="${sNickName}" id="nickName" name="nickName" required />
		      <div class="input-group-prepend">
		      	<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/>
		      </div>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="name">성명 <span style="color:#DB4455"><b>*</b></span></label>
	      <input type="text" class="form-control" id="name" value="${vo.name}" name="name" required />
	    </div>
	    <div class="form-group">
	      <label for="email1">Email address <span style="color:#DB4455"><b>*</b></span></label>
	        <div class="input-group mb-3">
	          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" value="${email1}" name="email1" required />
	          <div class="input-group-append">
	            <select name="email2" class="custom-select">
	              <option value="@naver.com" ${email2 == "@naver.com" ? "selected" : ""}>@naver.com</option>
	              <option value="@hanmail.net" ${email2 == "@hanmail.net" ? "selected" : ""}>@hanmail.net</option>
	              <option value="@hotmail.com" ${email2 == "@hotmail.com" ? "selected" : ""}>@hotmail.com</option>
	              <option value="@gmail.com" ${email2 == "@gmail.com" ? "selected" : ""}>@gmail.com</option>
	              <option value="@nate.com" ${email2 == "@nate.com" ? "selected" : ""}>@nate.com</option>
	              <option value="@yahoo.com" ${email2 == "@yahoo.com" ? "selected" : ""}>@yahoo.com</option>
	            </select>
	          </div>
	        </div>
	    </div>
	    <div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="gender" value="남자" <c:if test="${vo.gender == '남자'}">checked</c:if> />남자
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="gender" value="여자" <c:if test="${vo.gender == '여자'}">checked</c:if> />여자
	        </label>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="birthday">생일</label>
	      <input type="date" name="birthday" value="${vo.birthday.substring(0,10)}" class="form-control"/>
	    </div>
	    <div class="form-group">
	      <div class="input-group mb-3">
	        <div class="input-group-prepend">
	          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
	            <select name="tel1" class="custom-select">
	              <option value="010" ${tel1 == "010" ? "selected" : ""}>010</option>
	              <option value="02"  ${tel1 == "02" ? "selected" : ""}>02</option>
	              <option value="031" ${tel1 == "031" ? "selected" : ""}>031</option>
	              <option value="032" ${tel1 == "032" ? "selected" : ""}>032</option>
	              <option value="041" ${tel1 == "041" ? "selected" : ""}>041</option>
	              <option value="042" ${tel1 == "042" ? "selected" : ""}>042</option>
	              <option value="043" ${tel1 == "043" ? "selected" : ""}>043</option>
	              <option value="051" ${tel1 == "051" ? "selected" : ""}>051</option>
	              <option value="052" ${tel1 == "052" ? "selected" : ""}>052</option>
	              <option value="061" ${tel1 == "061" ? "selected" : ""}>061</option>
	              <option value="062" ${tel1 == "062" ? "selected" : ""}>062</option>
	            </select>-
	        </div>
	        <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control" required/>-
	        <input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control" required/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="address">주소 <span style="color:#DB4455"><b>*</b></span></label>
	      <div class="input-group mb-1">
	        <input type="text" name="postcode" value="${postcode}" id="sample6_postcode" placeholder="우편번호" class="form-control" required>
	        <div class="input-group-append">
	          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
	        </div>
	      </div>
	      <input type="text" name="roadAddress" value="${roadAddress}" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1" required>
	      <div class="input-group mb-1">
	        <input type="text" name="detailAddress" value="${detailAddress}" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
	        <div class="input-group-append">
	          <input type="text" name="extraAddress" value="${extraAddress}" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
	        </div>
	      </div>
	    </div>
	   
	    <div class="form-group">
	      <label for="content">자기소개</label>
	      <textarea rows="5" class="form-control" id="content" name="content">${vo.content}</textarea>
	    </div>
	    <div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">정보공개</span>&nbsp; &nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="userInfor" value="공개" <c:if test="${vo.userInfor == '공개'}">checked</c:if> />공개
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="userInfor" value="비공개" <c:if test="${vo.userInfor == '비공개'}">checked</c:if> />비공개
	        </label>
	      </div>
	    </div>
	    <div  class="form-group">
	      <p>회원 사진(파일용량:2MByte이내) :</p>
	      <input type="file" name="photo" id="file" value="${vo.photo}" onchange="imgCheck(this)" class="form-control-file border mb-3"/>
	      <img id="demoImg" src="${ctp}/images/member/${vo.photo}" width="200px"/>
	      <!-- <img id="demoImg" width="200px"/> -->
	      <hr/>
	    </div>
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">수정하기</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberRoom.mem';">돌아가기</button>
	    
	    <input type="hidden" name="email" />
	    <input type="hidden" name="tel" />
	    <input type="hidden" name="address" />
	  </form>
  </section>
</div>
</body>
</html>