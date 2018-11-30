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
<title>마이페이지</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style>
#mainDiv {
    float: left;
    
    width: 800px;
    height: 600px;
    text-align: left;
    margin: 20px auto;
    font-size: 30px;
    margin-left: 70px;
}
#subDiv{
	text-align: center;
	font-size: 22px;
	margin: 20px auto;
	padding-left : 20px;
	width: 700px;
	height: 550px;
}
#contentDiv{
	text-align: left;
	
}
footer{
float: left;
}

p{
font-size :15px;
margin-bottom: 10px;
}


	.new_password {}
	.new_password p {padding-bottom:10px;line-height:1.5}
	.new_password p strong {color:#fe6031;}
	.new_password p.tx_bk{line-height:1.5}
	.new_password p.tx_bk strong{color:#000;}
	.new_password .tit {
    display: block;
    padding: 0 0 15px 0;
    color: #272727;
    font-size: 15px;
    margin-bottom: 10px;
}
	.new_password ul {padding-bottom:35px;}
	.new_password li {padding-left:7px; background:url("/img/common/helpdesk/myphone/ico_bullet_dot.gif") no-repeat 0 7px; line-height:20px;}
	
	h3{
	margin-bottom: 25px;
	font-weight: bold;
	}
	hr {
    width: 675px;
    color: black;
    border: 1px solid black;
    margin-top: 0px;
    margin-bottom: 10px;
}
</style>

<script type="text/javascript">

</script>

</head>
<body>
<jsp:include page="/indexHeader.jsp"/>

<jsp:include page="/UpdateindexNavi.jsp" />

<script type="text/javascript">
function delete1(){
	if(member_password.value == "" && member_password1.value == "" ){
	alert("패스워드를 입력해주세요");
	document.getElementById('member_password').focus();
		
	}else if(member_password.value.length >1 && member_password1.value==""){
		alert("패스워드를 확인란에 입력해주세요");
		document.getElementById('member_password1').focus();	
	}else if(member_password.value != member_password1.value){
		alert("동일한 패스워드를 입력해주세요");
		document.getElementById('member_password').focus();
	}else if(confirm("정말 삭제하시겠습니까?")==true){
		document.deleteForm.submit();
	}else{
		alert()
		return false;
	}
	
}
</script>
<main>


<form action="${pageContext.request.contextPath }/member/myPageDelete" method="post" name="deleteForm">
<a href ="${pageContext.request.contextPath}">[메인화면]</a>


<div id="mainDiv">
	<div id="subDiv"><h3>회원정보</h3>
		<div id="contentDiv" class="new_password">
			<strong class="tit">회원탈퇴</strong>
			
		<hr class="hr">
		<input type="hidden" name="member_id" id="member_id" value="${loginmember.member_id}">
		<p>회원 ID :  ${loginmember.member_id}</p>
		<input type="hidden" name="member_address_id" id="member_address_id" value="${loginmember.member_address_id}"> 
		<p>회원 PW :  <input type="password" name="member_password"  id="member_password" ></p>
		<p>확인 PW :  <input type="password" name="member_password1" id="member_password1" ></p>
		<input type="button" value="회원탈퇴" onclick="delete1()">
		
		
		</div>
	
	</div>


</div>
</form>
</main>

<jsp:include page="/indexFooter.jsp"/>
</body>
</html>