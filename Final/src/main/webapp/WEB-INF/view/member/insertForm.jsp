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

<title>TJEFoodSpot : 회원가입</title>
<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>

<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>




<!--------- style  style  style  style  style  style  style  style  style  style -------->
<style>


/* @media ( max-width: 1200px ){

body{
	font-size: 150%;
}
#table_th {
	text-align:left;
	width: 30%;
	font-size: 1em;
}
caption{
font-size: 2em
}
td{
	width:25%;
}
button{
	width:20%
}
span{
	width:20%
}
input{
	width:20%
}

#checkPwd {
	color: red;


}

#insert_Updiv {
    border: 1px solid red;
    width: 100%;
    margin-left: 0%;
}
#insertdiv {
	border: 1px solid gold ;
    padding-top: 30px;
    width: 40%;
    height: 600px;
    background-color: orange;
    margin-left: 30%;
}
#insertTalbe {
    <!--border: 1in solid gold ;-->
    margin-left: 0%;
    width: 76%;
    height: 80%;
}
}

<!-- 반응형 종료시점 -->
 */
caption{
	text-align:center;
font-size: 1.5em
}
th {
	text-align:right;
	width: 30%;
	font-size: 1em;
}
#table_th{
	
	text-align: right;
}
#insert_Updiv {
    width: 100%;
    margin-left: 0%;
}
#insertdiv {
    padding-top: 30px;
    width: 40%;
    height: 600px;
    margin-left: 30%;
}
#insertTalbe {
    <!--border: 1in solid gold ;-->
    margin-left: 0%;
    width: 76%;
    height: 80%;
}
</style>


</head>
<body>
<jsp:include page="/indexHeader.jsp"/>


<form action="${pageContext.request.contextPath }/member/insert" method="post" onSubmit="return send();">
	<div id="insert_Updiv">
	<div align="center" id ="insertdiv">
	<table id="insertTalbe">
		
	<caption class="caption" >회원가입</caption>
	<tr>
		<td>	</td>
		<td>	</td>
		<td>	</td>
		<td>	</td>
	</tr>
	<tr>
		<th  >ID :　</th>
		<td colspan="3">  <input type="text" name="member_id" id="member_id" > <!-- onclick="idCK" -->
			<input type="hidden" name="hidden_idCK" value =0>
			<button type="button" id="idCheckBtn" class="btn btn-outline-light btn-sm" >ID 중복 체크</button> <!--  onclick="idCK()" -->
	 		<span id="idCheckMsg" style="color:red; font-size:small;"></span>
	 	</td>
		
	</tr>
	<tr>
		<th >PASSWORD :　</th>
		<td colspan="3"><input type="password" id="member_password" name="member_password" onkeyup="checkPwd()"> <span id="checkPwd1" style="font-size: xx-small; ">패스워드를 입력하세요</span>
		</td>
	</tr>
	<tr>
		<th >PASSWORD CHECK :　</th>
		<td colspan="3"><input type="password" id="member_password1" name="member_password1"  onkeyup="checkPwd()"><span id="checkPwd" style="font-size: xx-small; ">동일한 패스워드 입력하세요.</span>
		</td>
	
	</tr>
	<tr>
		<th>이름 :　</th>
		<td colspan="3"><input type="text" name="member_name" id ="member_name"></td>
	
	</tr>
	<tr>
		<th>별명 :　</th>
		<td colspan="3"><input type="text" name="member_nickname" id="member_nickname"  > 
		<button type="button" id="nickCheckBtn" class="btn btn-outline-light btn-sm">별명 중복 체크</button> <span id="nickNameCheckMsg" style="color:red; font-size:small;"></span></td>
	
	</tr>
	<tr>
		<th>전화번호 :　</th>
		<td colspan="3">
		<input type="text" name="member_tel" placeholder="010-0000-0000" id="member_tel" > 
		</td>
	</tr>
	<tr>
		<th>주소 :　</th>
		<td colspan="3"><input type="hidden" id="add_hidden" oninput="input_hidden">
 		<input type ="text" name = "member_address.address_postcode" id="postcode" placeholder="우편번호" style="width:100px; ">  
 		<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-light btn-sm">주소검색</button>
		
		</td>
	</tr>
	<tr>
		<th></th>
		<td colspan="3">
			
 			<input type ="text" id="add1" name = "member_address.address_city" placeholder="시" style="width:100px; "> 
 			<input type ="text" id="add2" name = "member_address.address_gu" placeholder="구" style="width:90px; "> 
 			<input type ="text" id="add3" name = "member_address.address_dong" placeholder="동" style="width:200px;"> 
		</td>
		
	</tr>
	<tr>
		<th></th>
		<td colspan="3"><input type ="text" id="add4" name = "member_address.address_detail"  placeholder="상세주소" style="width:300px; "></td>
	</tr>
	<tr>
		<th>이메일 :　</th>
		<td colspan="3"><input type="email" name="member_email" id="member_email"></td>
	</tr><tr>
		<th>생년월일 :　</th>
		<td colspan="3"><input type="text" name="member_birthday" placeholder="YYYYMMDD" id="member_birthday"></td>
	</tr><tr>
		<th>성별 :　</th>
				<td colspan="3">
					<input type = "radio" name = "member_gender" value = "남" checked = "checked">남
					<input type = "radio" name = "member_gender" value = "여">여
				</td>
	</tr>
	<tr>
		<th>사진 :　</th>
		<td colspan="3"><input type="text" name="member_photo"></td>
	</tr>
	<tr>
		<th></th>
		<td colspan="3"><input type="submit" value="회원가입" id="submit"  onclick="submitCK()" class="btn btn-outline-light btn-sm"><!-- disabled="disabled" --></td>
	</tr>
	
	</table>
	</div></div>
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
var member_password1 =document.getElementById('member_password1');
var member_name = document.getElementById('member_name');
var member_nickname = document.getElementById('member_nickname');
var member_tel =  document.getElementById('member_tel');
var member_email =  document.getElementById('member_email');
var member_birthday =  document.getElementById('member_birthday');

var add4 = document.getElementById('add4');


function send() {
	
	if(member_id.value==""  ){
		alert("ID를 입력하세요.");
		document.getElementById('member_id').focus();
		return false;	
	}else if( member_id.value.length < 4){
		alert("ID를 4글자이상 입력해주세요.");
		document.getElementById('member_id').focus();
		return false;	
	}else if(member_password.value=="" ||member_password1.value=="" ){
		alert("패스워드를 입력하세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if (member_password.value != member_password1.value){
		alert("동일한 패스워드를 입력해주세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if(member_password.value.length < 6){
		alert("패스워드를 6글자이상 입력해주세요.");
		document.getElementById('member_password').focus();
		return false;	
	}else if (member_name.value==""	){
		alert("이름을 입력하세요.");
		document.getElementById('member_name').focus();
		return false;
	}else if( member_nickname.value==""){
		alert("닉네임을 입력하세요.");
		document.getElementById('member_nickname').focus();
		return false;
	}else if (member_tel.value==""){
		alert("전화번호를 입력하세요.");
		document.getElementById('member_tel').focus();
		return false;
	}else if (add4.value==""){
		alert("상세주소를 입력하세요.");
		document.getElementById('add4').focus();
		return false;
	}else if (member_email.value==""){
		alert("E-Mail를 입력하세요.");
		document.getElementById('member_email').focus();
		return false;
	}else if (member_birthday.value==""){
		alert("생년월일을 입력하세요.");
		document.getElementById('member_birthday').focus();
		return false;
	}else if(member_birthday.value.length >=9){
		alert("생년월일에 타이푼을 빼고 입력바랍니다..");
		document.getElementById('member_birthday').focus();
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
	  var pw2 = document.getElementById('member_password1').value; 
		
	  
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
<!--  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  DAUM API  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
			
                
                
                
                //서울 강서구 마곡중앙로    11 (내발산동, 공원관리사무실)
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('add_hidden').value = fullAddr;
              	
      			var cut =fullAddr.split("(");
      		   //서울 강서구 마곡중앙로  11  // 내발산동, 공원관리사무실)
            	var cuted1 =cut[0];
            	var cuted2 =cut[1];
      		   var add1 ="(";
      		   var str1 =cuted1.split(" ");
            	
            	var a1 = str1[0];
                var a2 = str1[1];
                var a3 = str1[2];
                var a4 = str1[3];
                var a6 = str1[4];
                var a7 = str1[5];
              	var a5 = ' ';
          		
              //서울 강서구 마곡중앙로  11 (내발산동, 공원관리사무실)
          		document.getElementById('add1').value = a1;
                document.getElementById('add2').value = a2;
                document.getElementById('add3').value = a3+a5+a4+a5+a6+a5+add1+cuted2;
                /*document.getElementById('add4').value = a4;
                
                /* alert("#add_hidden".val());
            	var str;
            	var str = $("#add_hidden");
            	var str1 =str.split(" ");
            	
            	
            	
   
                var a1 = str1[0];
                var a2 = str1[1];
                var a3 = str1[2];
                var a4 = str1[3];
              
              	$("#add1,#add2,#add3,#add4").change(function(){
              		alert(str1[0]);
              		document.getElementById('add1').value = a1;
                    document.getElementById('add2').value = a2;
                    document.getElementById('add3').value = a3;
              		for( var i = 0 ; i < 3; i++	){
                    	alert(str1[i]);
                    	
    				}    
    			}); */
    			

    			
		
             
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('add4').focus();
            }
        }).open();
    }
    $("#add_hidden").change(function(){
    	alert(111);
  		
	});
</script>


	<jsp:include page="/indexFooter.jsp"/>

</body>
</html>
