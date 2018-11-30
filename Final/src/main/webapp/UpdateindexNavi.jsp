<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<head>

<style type="text/css">
#updateNav {
    float: left;
    width: 17%;
    height: 657px;
    padding-top: 50px;
    padding-left: 10%;
    margin-left: 7%;
}
#updateDiv {
    border: 2px solid gold;
    width: 100%;
    height: 200px;
    border-radius: 10px;
}
#updqteDiv_ul{
  padding-left: 25px;
  padding-top: 10px;
}
#updqteDiv_li{
  list-style-type : circle;
 

}

header {
    text-align: left;
    padding-top: 10px;
    padding-left: 10px;
    font-size: 13px;
    font-weight: bold;
    
}
#hide {
    border-bottom: 1px dashed  gold;
    padding-top: 7px;
}
 
</style>
</head>


	<nav id="updateNav" >
		
		<div id="updateDiv" style="width: 154px; height: 174px;">
		<header>TJE - MICHELIN 회원정보</header>
		<p style="size: 10px" id="hide"></p>
			<ul  id="updqteDiv_ul">
				<li id="updqteDiv_li"><a href="${pageContext.request.contextPath}/member/myPage">내 정보</a></li>
				<li id="updqteDiv_li"><a href="${pageContext.request.contextPath}/member/myPageUpdate">개인정보 변경</a></li>
				<li id="updqteDiv_li"><a href="${pageContext.request.contextPath}/member/myPagePasswordUpdate">비밀번호 변경</a></li>
				<li id="updqteDiv_li"><a href="#">비밀번호찾기?[Q&A]</a></li>
				<li id="updqteDiv_li"><a href="${pageContext.request.contextPath}/member/myPageDelete">회원탈퇴</a></li>
			</ul>
		</div>
		<br/>
		<div>
		<p style="font-size: 10px;margin-bottom: 0px;">더조은 미슐랭을 이용해주셔서 </p>
		<p style="font-size: 10px;">감사합니다.</p>
		</div>
	</nav>


