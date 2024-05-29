<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberJoin.jsp</title>
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
    		/* height : 500px; */1
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
    	
    	
    	// 회원가입처리
    	let idCheckBtn = 0;
	    let nickCheckBtn = 0;
	    
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
	        
	        // 전화번호 형식 체크
	        if(tel2 != "" && tel3 != ""){
	        	// 전화번호 정규화 체크
	        }
	        else {
	        	tel2 = " ";
	        	tel3 = " ";
	        	tel = tel1 + "-" + tel2 + "-" + tel3;
	        }
	    	/* 
	    	// 정규식, 유효성
	    	if(!regMid.test(mid)){
	    		alert("영문 대소문자와 숫자의 8~16자 조합으로 입력해주세요.")
	    	}
	    	else if(!regPwd.test(pwd)){
	    		alert("최소 8자, 하나의 이상의 대소문자 및 하나의 숫자, 하나의 특수문자를 입력해주세요.");
	    		myform.pwd.focus();
	    		return false;
	    	}
	    	 */
	    	
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
	    	else return false;
	    	
	    	// 아이디, 닉네임 중복 체크버튼
			if(idCheckBtn == 0){
				alert("아이디 중복 체크를 해주세요.");
				document.getElementById("midBtn").focus();
			}
			else if(nickCheckBtn == 0){
				alert("닉네임 중복 체크를 해주세요.");
				document.getElementById("nickNameBtn").focus();
			}
			else{
	    		myform.email.value = email;
	    		myform.tel.value = tel;
	    		myform.address.value = address;
	    		
	    		myform.submit();
	    	}
		}
    	
    	// 아이디 중복체크
    	function idCheck() {
			let mid = myform.mid.value;
			if(mid.trim() == ""){
				alert("아이디를 입력해주세요");
				myform.mid.focus();
			}
			else {
				idCheckBtn = 1;
				
				$.ajax({
					url : "${ctp}/MemberIdCheck.mem",
					type : "get",
					data : {mid : mid},
					success : function (res) {
						if(res != '0'){
							alert("이미 존재하는 아이디입니다.");
							myform.mid.focus();
						}
						else alert("사용가능한 아이디입니다.");
					},
					error : function () {
						alert("전송오류");
					}
				});
			}
		}
    	// 닉네임 중복체크
    	function nickCheck() {
			let nickName = myform.nickName.value;
			if(nickName.trim() == ""){
				alert("닉네임을 입력해주세요");
				myform.nickName.focus();
			}
			else {
				nickCheckBtn = 1;
				
				$.ajax({
					url : "MemberNickNameCheck.mem",
					type : "post",
					data : {nickName : nickName},
					success : function (res) {
						if(res != '0'){
							alert("이미 사용중인 닉네임입니다.");
							myform.nickName.focus();
						}
						else alert("사용가능한 닉네임입니다.");
					},
					error : function () {
						alert("전송오류");
					}
				});
			}
		}
    	// 아이디, 닉네임 다시 고쳤을 경우 다시 중복버튼 체크하게 유도
    	/* 
    	$(function(){
        	$("#mid").on("blur", () => {
        		idCheckBtn = 0;
        	});
        	
        	$("#nickName").on("blur", () => {
        		nickCheckBtn = 0;
        	});
        	
        });
    	 */
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
		<form name="myform" method="post" action="${ctp}/MemberJoinOk.mem" enctype="multipart/form-data" class="was-validated"><!-- enctype="multipart/form-data" -->
	    <h2 style="font-family: a신디나루B; color:#075663">회원가입</h2>
	    <p style="font-family: a영고딕B; color: #708090;">동물의숲 회원가입 후 다양한 서비스를 경험해보세요.</p>
	    <hr/>
	    <div class="form-group">
	      <label for="mid">아이디 <span style="color:#DB4455"><b>*</b></span></label>
	      <div class="input-group mb-1">
		      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
		      <div class="input-group-prepend">
		      	<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary" onclick="idCheck()" />
		      </div>
		  </div>
	    </div>
	    <div class="form-group">
	      <label for="pwd">비밀번호 <span style="color:#DB4455"><b>*</b></span></label>
	      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
	    </div>
	    <div class="form-group">
	      <label for="nickName">닉네임 <span style="color:#DB4455"><b>*</b></span></label>
	      <div class="input-group mb-1">
		      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
		      <div class="input-group-prepend">
		      	<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/>
		      </div>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="name">성명 <span style="color:#DB4455"><b>*</b></span></label>
	      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
	    </div>
	    <div class="form-group">
	      <label for="email1">Email address <span style="color:#DB4455"><b>*</b></span></label>
	        <div class="input-group mb-3">
	          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
	          <div class="input-group-append">
	            <select name="email2" class="custom-select">
	              <option value="naver.com" selected>@naver.com</option>
	              <option value="hanmail.net">@hanmail.net</option>
	              <option value="hotmail.com">@hotmail.com</option>
	              <option value="gmail.com">@gmail.com</option>
	              <option value="nate.com">@nate.com</option>
	              <option value="yahoo.com">@yahoo.com</option>
	            </select>
	          </div>
	        </div>
	    </div>
	    <div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="gender" value="여자">여자
	        </label>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="birthday">생일</label>
	      <input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control"/>
	    </div>
	    <div class="form-group">
	      <div class="input-group mb-3">
	        <div class="input-group-prepend">
	          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
	            <select name="tel1" class="custom-select">
	              <option value="010" selected>010</option>
	              <option value="02">02</option>
	              <option value="031">"031"</option>
	              <option value="032">032</option>
	              <option value="041">041</option>
	              <option value="042">042</option>
	              <option value="043">043</option>
	              <option value="051">051</option>
	              <option value="052">052</option>
	              <option value="061">061</option>
	              <option value="062">062</option>
	            </select>-
	        </div>
	        <input type="text" name="tel2" size=4 maxlength=4 class="form-control" required/>-
	        <input type="text" name="tel3" size=4 maxlength=4 class="form-control" required/>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="address">주소 <span style="color:#DB4455"><b>*</b></span></label>
	      <div class="input-group mb-1">
	        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control" required>
	        <div class="input-group-append">
	          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
	        </div>
	      </div>
	      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1" required>
	      <div class="input-group mb-1">
	        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
	        <div class="input-group-append">
	          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
	        </div>
	      </div>
	    </div>
	    
	    <!-- 홈페이지주소, 직업, 취미
	    <div class="form-group">
	      <label for="homepage">Homepage address:</label>
	      <input type="text" class="form-control" name="homePage" value="http://" placeholder="홈페이지를 입력하세요." id="homePage"/>
	    </div>
	    
	    <div class="form-group">
	      <label for="name">직업</label>
	      <select class="form-control" id="job" name="job">
	        <option value="">직업선택</option>
	        <option>학생</option>
	        <option>회사원</option>
	        <option>공무원</option>
	        <option>군인</option>
	        <option>의사</option>
	        <option>법조인</option>
	        <option>세무인</option>
	        <option>자영업</option>
	        <option selected>기타</option>
	      </select>
	    </div>
	    
	    <div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">취미</span> &nbsp; &nbsp;
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="등산" name="hobby"/>등산
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="낚시" name="hobby"/>낚시
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="수영" name="hobby"/>수영
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="독서" name="hobby"/>독서
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="영화감상" name="hobby"/>영화감상
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="바둑" name="hobby"/>바둑
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="축구" name="hobby"/>축구
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="checkbox" class="form-check-input" value="기타" name="hobby" checked/>기타
	        </label>
	      </div>
	    </div>
	    -->
	    
	    <div class="form-group">
	      <label for="content">자기소개</label>
	      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
	    </div>
	    <div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
	        </label>
	      </div>
	      <div class="form-check-inline">
	        <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
	        </label>
	      </div>
	    </div>
	    <div  class="form-group">
	      회원 사진(파일용량:2MByte이내) :
	      <input type="file" name="photo" id="file" onchange="imgCheck(this)" class="form-control-file border mb-3"/>
	      <img id="demoImg" width="200px"/>
	      <hr/>
	    </div>
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberLogin.mem';">돌아가기</button>
	    
	    <input type="hidden" name="email" />
	    <input type="hidden" name="tel" />
	    <input type="hidden" name="address" />
	  </form>
  </section>
</div>
</body>
</html>