<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>Login Page</title>

<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>


<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">

<!-- 
<style>
 	#loginform {
    width: 100%;
    /* height: 1%; */
    padding: 10%;
} 
#loginForm {
    width: 30%;
    height: 300px;
    background-color: gold;
    border-radius: 2em;
}
.member_id{
    width: 80%;
    height: 50px;
    font-size: 16px;
}
.member_password{
    width: 80%;
    height: 50px;
    font-size: 16px;
}
 

#user_Label{
	text-align:right;
	width : 50px;
	height:50px;
	font-size: 16; 
	font-weight: bold;
	margin :0 auto;
}
th{
text-align:center;
}
input{
	
}
</style>
 -->
<script type="text/javascript">
function loginBtn(){

	
	if(member_id.value =="" && member_password.value==""){
		alert("정보를 입력해주세요");
		document.getElementById('member_id').focus();
	}else if(member_id.value.length>0 && member_password.value==""){
		alert("정보를 입력해주세요");
		document.getElementById('member_password').focus();
	}else if(member_id.value==""&&member_password.value.length>0){
		alert("정보를 입력해주세요");
		document.getElementById('member_id').focus();
	}else if (true){
		document.loginForm.submit();
	}
	
}
</script>

</head>
<body>

	<jsp:include page="/indexHeader.jsp"/>

    <div class="container">
    <div class="col-lg-4"> </div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px; margin-top: 20px;">
      	  <form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm" name="loginForm">
          
                <h3 style="text-align: center;">로그인</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" 
                           name="member_id" maxlength="20" id="member_id">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" 
                           name="member_password" maxlength="20" id="member_password">
                </div>
                <input type="button" class="btn btn-primary form-control" value="로그인" onclick="loginBtn()">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
    </div>
	
	
	<jsp:include page="/indexFooter.jsp"/>
	
</body>
</html>