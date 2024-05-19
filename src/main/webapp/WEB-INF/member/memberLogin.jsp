<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberLogin.jsp</title>
    <jsp:include page="/include/bs4.jsp" />
    <style>
    	body{
    		background: url("<%=request.getContextPath() %>/images/visual_bg_pc.png");
    		<%-- background: url("<%=request.getContextPath() %>/images/bg_1.png"); --%>
    	}
    	.container{
    		width : 50%;
    		background-color : rgba(245,243,215,0.8);
    		border-radius : 20px;
    		padding : 30px
    	}
    </style>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">
    <table class="table table-borderless text-center">
      <tr>
        <td colspan="2"><font size="5">로 그 인</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${mid}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" value="1234" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="로그인" class="btn btn-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
          <input type="button" value="회원가입" onclick="location.href='${ctp}/MemberJoin.mem';" class="btn btn-primary mr-4"/>
	    		<input type="checkbox" name="idSave" checked /> 아이디 저장
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
</body>
</html>