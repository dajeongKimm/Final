<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

    new daum.Postcode({

        oncomplete: function(data) {

            if(data.userSelectedType=="R"){

                // userSelectedType : 검색 결과에서 사용자가 선택한 주소의 타입

                // return type : R - roadAddress, J : jibunAddress

                // TestApp 은 안드로이드에서 등록한 이름

                window.SignUpTestApp.setAddress(data.zonecode, data.roadAddress, data.buildingName);

            }

            else{

                window.SignUpTestApp.setAddress(data.zonecode, data.jibunAddress, data.buildingName);

            }       

        }

    }).open();

</script>


<meta charset="UTF-8">
<title>상세주소</title>
</head>
<body>

</body>
</html>