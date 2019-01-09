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
    height: 800px;
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



</head>
<body>
<jsp:include page="/indexHeader.jsp"/>
<jsp:include page="/UpdateindexNavi.jsp" />

<main>

<form action="${pageContext.request.contextPath }/member/myPageUpdate" method="post">
<a href ="${pageContext.request.contextPath}">[메인화면]</a>

<div id="mainDiv">
	<div id="subDiv"><h3>회원정보 변경</h3>
		<div id="contentDiv" class="new_password">
			<strong class="tit">개인 정보를 변경 하실 수 있습니다.</strong>
			
		<hr class="hr">
		
		<p>회원 ID :  ${loginmember.member_id}</p>
		<p>회원 이름 : ${loginmember.member_name}</p>
		<p>회원 닉네임 : <input type="text" name="member_nickname" id="member_nickname" value="${loginmember.member_nickname}"></p>
		<p>회원 전화번호 : <input type="tel" name="member_tel" id="member_tel" value="${loginmember.member_tel}"></p> 
		<p>회원 이메일 : <input type="email" name="member_email" id="member_email" value="${loginmember.member_email}"></p>
		회원 주소 
		<p> <input type="text" id="address_postcode" name="member_address.address_postcode" value="[${loginmember.member_address.address_postcode}]" readonly style="background-color: #d6d6d6;"> <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>    </p> 
		<div>
		<p> <input type="text" id="address_general" name="member_address.address_general" value="${loginmember.member_address.address_general}" readonly 
		style=" width: 37%; background-color: #d6d6d6;"></p>
		</div>
		<div>
		<p> <input type="text" id="address_detail" name="member_address.address_detail" value="${loginmember.member_address.address_detail}" style="width: 37%">  </p>
		</div>
		<p>회원 프로필 :  ${loginmember.member_photo}</p>
		<p>변경할 프로필 : <input type="text" name="member_photo" id="member_photo"></p>	
		<input type="submit" value="회원정보 변경">
		<input type="hidden" name="member_address.member_address_id" id="member_address_id" value="${loginmember.member_address_id}" />
		<input type="hidden" name="member_id" id="member_id" value="${loginmember.member_id}" />
		<input type="hidden" name="member_password" id="member_password" value="${loginmember.member_password}" />
		</div>
	
	</div>


</div>

</form>
</main>


<!--  다음 우편번호 API  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>    
    
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
             /*   $("[name=member_address.member_postcode]").val(data.zonecode);
               $("[name=member_address.member_address]").val(fullRoadAddr);
               */
               
               document.getElementById('address_postcode').value = data.zonecode;
               document.getElementById('address_general').value = fullRoadAddr;
               
               document.getElementById('address_detail').focus();
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }
</script>




<jsp:include page="/indexFooter.jsp"/>
</body>
</html>