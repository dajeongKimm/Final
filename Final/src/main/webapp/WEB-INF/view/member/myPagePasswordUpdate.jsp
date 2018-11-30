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
    margin-left: 70px;
}
#subDiv{
	text-align: center;
	font-size:22px;
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
p{
font-size :15px;
margin-bottom: 10px;
}
</style>
<script type="text/javascript">


</script>


</head>
<body>
<jsp:include page="/indexHeader.jsp"/>
<jsp:include page="/UpdateindexNavi.jsp" />

<main>

<form action="${pageContext.request.contextPath }/member/myPagePasswordUpdate" method="post">
<a href ="${pageContext.request.contextPath}">[메인화면]</a>

<div id="mainDiv">
	<div id="subDiv"><h3>회원 PASSWORD 변경</h3>
		<div id="contentDiv" class="new_password">
			<strong class="tit"> PASSWORD를 변경 하실 수 있습니다.</strong>
			
		<hr class="hr">
		<input type="hidden" name="member_id" id="member_id" value="${loginmember.member_id}">
		<p>회원 ID :  ${loginmember.member_id}</p>
		
		<p>회원 PW :  <input type="password" name="member_password" id="member_email" oninput="dbckPW()">　<span id="dbckPW" style="color:red; font-size:small;"></span> </p>
		<p>변경할 PW : <input type="password" name="member_password2" id="member_email">　<span id="chPW" style="color:red; font-size:small;"></span> </p>
		<p>변경확인 PW : <input type="password" name="member_password3" id="member_email">　<span id="chckPW" style="color:red; font-size:small;"></span> </p>
			<p><input type="submit" value="변경"></p>
		
		</div>
	
	</div>


</div>

</form>
</main>

<jsp:include page="/indexFooter.jsp"/>
</body>
</html>