<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>


<!-- 서버에서 전달해준 BindingResult 객체를 사용하기 위해서는
	아래의 태그 라이브러리를 추가해야 한다. -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">

<title>TJEFoodSpot : 회원가입</title>
<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">

<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>





</head>
<body>
<jsp:include page="/indexHeader.jsp"/>



<form action="${pageContext.request.contextPath }/member/insert" method="post" onSubmit="return send();">

	
	<div class="form-group" id="divInputId">
	    <label>아이디</label> <br />
    	<input class="form-control" style="width: 40%; display: inline;" placeholder="아이디를 입력해주세요." name="member_id" id="member_id" type="text"  />
		<button type="button" class="btn btn-default" id="idCheckBtn"><i class="fa fa-search"></i> 중복확인</button>
		<span id="idCheckMsg" style="color:red; font-size:small;"></span>
	  <spring:hasBindErrors name="member">
                  <c:if test="${errors.hasFieldErrors('member_id') }">                                     
                           <spring:message
                                   code="${errors.getFieldError('member_id').codes[0]}"
                                   text="${errors.getFieldError('member_id' ).defaultMessage  }"
                           />  
                           <spring:message
                                   code="${errors.getFieldError('member_id').codes[1]}"
                                   text="${errors.getFieldError('member_id' ).defaultMessage  }"
                           />        
                  </c:if>
         </spring:hasBindErrors>
	</div>
	
	
	<div class="form-group">
	<label>비밀번호</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="비밀번호를 입력해주세요." name="member_password" id="member_password" type="password" onkeyup="checkPwd();"  />
    <span id="checkPwd1" style="font-size: xx-small; ">패스워드를 입력하세요</span>
		<spring:hasBindErrors name="member">
			<c:if test="${errors.hasFieldErrors('member_password') }">
				<strong>${errors.getFieldError('member_password').defaultMessage }</strong>
			</c:if>
		</spring:hasBindErrors>
</div>

	<div class="form-group">
	<label>비밀번호 확인</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="비밀번호 확인" name="userpwdcheck" id="userpwdcheck" type="password" onkeyup="checkPwd();" />
    <span id="checkPwd" style="font-size: xx-small; ">동일한 패스워드 입력하세요.</span>

</div>
	
	
		<div class="form-group">
	<label>이름</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="이름" name="member_name" id="member_name" type="text"  />
</div>

	<div class="form-group" id="divInputNickName">
	    <label>아이디</label> <br />
    	<input class="form-control" style="width: 40%; display: inline;" placeholder="닉네임을 입력해주세요." name="member_nickname" id="member_nickname" type="text"  />
		<button type="button" class="btn btn-default" id="nickCheckBtn"><i class="fa fa-search"></i> 중복확인</button>
		<span id="nickNameCheckMsg" style="color:red; font-size:small;"></span>
	  <spring:hasBindErrors name="member">
                  <c:if test="${errors.hasFieldErrors('member_nickname') }">                                     
                           <spring:message
                                   code="${errors.getFieldError('member_nickname').codes[0]}"
                                   text="${errors.getFieldError('member_nickname' ).defaultMessage  }"
                           />  
                           <spring:message
                                   code="${errors.getFieldError('member_nickname').codes[1]}"
                                   text="${errors.getFieldError('member_nickname' ).defaultMessage  }"
                           />        
                  </c:if>
         </spring:hasBindErrors>
	</div>

	<div class="form-group">
	<label>성별</label> <br />		
					<input type = "radio" name = "member_gender" value = "남자" checked = "checked">남자
					<input type = "radio" name = "member_gender" value = "여자">여자
</div>
	
	<div class="form-group">
	<label>이메일</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="ex)abc@abc.com" name="member_email" id="member_email" type="text"  />
</div>
	<div class="form-group">
	<label>연락처</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="010-1234-5678" name="member_tel" id="member_tel" type="text"  />
</div>

	<div class="form-group">
	<label>생일</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="YYMMDD" name="member_birthday" id="member_birthday" type="text"  />
</div>
	
	<div class="form-group"> 
	<label>주소</label> <br />                 
<input class="form-control" type="text" name = "member_address.address_postcode" style="width: 40%; display: inline;" placeholder="우편번호" id="address_postcode"  readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" type="text" name = "member_address.address_general" style="top: 5px;" placeholder="도로명 주소" id="address_general" readonly="readonly" />
</div>
<div class="form-group">
    <input class="form-control" type="text" name = "member_address.address_detail"id="address_detail"  placeholder="상세주소"  />
</div>
	<div class="form-group" style="text-align: center;">
		<input id="submit" type="submit" class="btn btn-default" value="회원가입" onclick="submitCK();">
		<input type="button" class="btn btn-default" onclick="location='../index.jsp'" value="취소">
	</div>
</form>




<!-- 
<script type="text/javascript">
function idCK() { 
	  mywin = window.open ('mbr_regist_id_check.php?mbrID='+document.DForm.mbrID.value,'IDduplicateCheck','width=434,height=300'); 
	mywin.focus(); 
	} 
</script>
 -->
<script type="text/javascript">
var member_id = document.getElementById('member_id');
var idCheckBtn = document.getElementById('idCheckBtn');
var member_password =document.getElementById('member_password');
var userpwdcheck =document.getElementById('userpwdcheck');
var member_name = document.getElementById('member_name');
var member_nickname = document.getElementById('member_nickname');
var member_tel =  document.getElementById('member_tel');
var member_email =  document.getElementById('member_email');
var member_birthday =  document.getElementById('member_birthday');

var address_postcode = document.getElementById('address_postcode');
var address_general = document.getElementById('address_general');
var address_detail = document.getElementById('address_detail');


function send() {
	
	if(member_id.value=="" || member_id.value.length == 0  ){
		alert("ID를 입력하세요.");
		document.getElementById('member_id').focus();
		return false;	
	}else if( member_id.value.length < 4){
		alert("ID를 4글자이상 입력해주세요.");
		document.getElementById('member_id').focus();
		return false;	
	}else if(member_password.value=="" || userpwdcheck.value=="" ){
		alert("패스워드를 입력하세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if (member_password.value != userpwdcheck.value){
		alert("동일한 패스워드를 입력해주세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if(member_password.value.length < 6){
		alert("패스워드를 6글자이상 입력해주세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if (member_name.value=="" || member_name.value.length == 0){
		alert("이름을 입력하세요.");
		document.getElementById('member_name').focus();
		return false;
	}else if( member_nickname.value=="" || member_nickname.value.length == 0){
		alert("닉네임을 입력하세요.");
		document.getElementById('member_nickname').focus();
		return false;
	}else if (member_email.value=="" || member_email.value.length == 0){
		alert("E-Mail를 입력하세요.");
		document.getElementById('member_email').focus();
		return false;
	}else if (member_tel.value=="" || member_tel.value.length == 0){
		alert("전화번호를 입력하세요.");
		document.getElementById('member_tel').focus();
		return false;
	}else if (member_birthday.value=="" || member_birthday.value.length == 0){
		alert("생년월일을 입력하세요.");
		document.getElementById('member_birthday').focus();
		return false;
	}else if(member_birthday.value.length >=9){
		alert("생년월일에 타이푼을 빼고 입력바랍니다..");
		document.getElementById('member_birthday').focus();
		return false;
	}else if(address_postcode.value.length == 0 || address_general.value.length == 0){
		alert("주소를 입력하세요.")
		document.getElementById('address_detail').focus();
		return false;
	}
	else if (address_detail.value=="" || address_detail.value.length == 0){
		alert("상세주소를 입력하세요.");
		document.getElementById('address_detail').focus();
		return false;
	}
	
}

</script>
<script type="text/javascript">
	$("#idCheckBtn").click(function () {
		//  #은  name=member_id 가아니라 id=member_id 즉 id값을 가져오는거라  name에서 하면 undefiend
		var member_id = $("#member_id").val();		
		//alert(member_id);  새로운창뜨면서 출력
		$.ajax({			
			type: "POST",			
			url: "${pageContext.request.contextPath}/member/checkId/" + member_id,			
			dataType: "json",
			success: function (result) {				
				$("#idCheckMsg").text(result.value);
			},
			error: function () {
				$("#idCheckMsg").text("ID 중복 체크 실패");
			}
		});
		
	});
</script>

<script type="text/javascript">
	$("#nickCheckBtn").click(function () {
		//  #은  name=member_id 가아니라 id=member_id 즉 id값을 가져오는거라  name에서 하면 undefiend
		var member_nickname = $("#member_nickname").val();		
		//alert(member_id);  새로운창뜨면서 출력
		$.ajax({			
			type: "POST",			
			url: "${pageContext.request.contextPath}/member/checkNick/" + member_nickname ,			
			dataType: "json",
			success: function (result) {				
				$("#nickNameCheckMsg").text(result.value);
			},
			error: function () {
				$("#nickNameCheckMsg").text("NickName 중복 체크 실패");
			}
		});
		
	});
</script>
<script type="text/javascript">
function checkPwd(){
	/* <form> →document.forms[0] 
	<input type=text value='Text1'> →document.forms[0].elements[0] 
	<input type=text value='Text2'> →document.forms[0].elements[1] 
	<input type=submit> 
	</form><form> →document.forms[1] 
	<input type=text value='Text1'> →document.forms[1].elements[0] 
	<input type=text value='Text2'> →document.forms[1].elements[1] 
	<input type=submit> 
	</form>  */
	  
	  var pw1 = document.getElementById('member_password').value;
	  var pw2 = document.getElementById('userpwdcheck').value; 
		
	  
	  if(pw1.length ==0 &&pw2.length ==0){
		 document.getElementById('checkPwd1').style.color = "red";
		 document.getElementById('checkPwd1').innerHTML = "패스워드를 입력하세요";
		 document.getElementById('checkPwd').style.color = "red";
		 document.getElementById('checkPwd').innerHTML = "패스워드확인란에 입력하세요";
	 }   else if(pw1.length  < 6 && pw2.length ==0){
		 
		 document.getElementById('checkPwd1').style.color = "red";
		 document.getElementById('checkPwd1').innerHTML = "패스워드 6글자이상 입력하세요";
		 document.getElementById('checkPwd').style.color = "red";
		 document.getElementById('checkPwd').innerHTML = "패스워드 6글자이상 입력하세요";
	 }  else if(pw1.length >=6 &&pw2.length ==0){
		 document.getElementById('checkPwd1').style.color = "black";
		 document.getElementById('checkPwd1').innerHTML = "OK";
		 document.getElementById('checkPwd').style.color = "red";
		 document.getElementById('checkPwd').innerHTML = "패스워드확인란에 입력하세요";
	 }else if(pw1.length <6 && pw2.length <6){
		 document.getElementById('checkPwd1').style.color = "red";
		 document.getElementById('checkPwd1').innerHTML = "패스워드 6글자이상 입력하세요";
		 document.getElementById('checkPwd').style.color = "red";
		 document.getElementById('checkPwd').innerHTML = "패스워드 6글자이상 입력하세요";
	 }
	 else if(pw1!=pw2){
		 document.getElementById('checkPwd1').style.color = "red";
		 document.getElementById('checkPwd1').innerHTML = "동일한 암호를 입력하세요."; 
		 document.getElementById('checkPwd').style.color = "red";
		 document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	  }else if(pw1 == pw2){
		 document.getElementById('checkPwd1').style.color = "black";
		 document.getElementById('checkPwd1').innerHTML = "OK";
		 document.getElementById('checkPwd').style.color = "black";
		 document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	   
	  }
}
</script>
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
