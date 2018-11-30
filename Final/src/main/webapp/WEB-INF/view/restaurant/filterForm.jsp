<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter Form Test</title>
<style>

div label input {
   margin-right:100px;
}

#ck-button {
    margin:4px;
    background-color:#EFEFEF;
    border-radius:4px;
    border:1px solid #D0D0D0;
    overflow:auto;
    float:left;
}

#ck-button label {
    float:left;
    width:10.0em;
}

#ck-button label span {
    text-align:center;
    padding:3px 0px;
    display:block;
}

#ck-button label input {
    position:absolute;
    top:-1000px;
}

#ck-button input:checked + span {
    background-color:#911;
    color:#fff;
}

#search, #deli{
	clear: both;
	text-align: center;
}
#deli2, #deli3, #deli4{
	text-align: center;
}

</style>
</head>
<body>

<form action="${pageContext.request.contextPath}/filter/result" method="post">

	<div id="deli4">
	<label for="com.tje.model.FilterView"><h4>음식종류</h4></label><br>
		<input type="radio" name="menu_type" value="한식" checked="checked"> 한식
			<img src="${pageContext.request.contextPath}/resources/img/한식.png" width="100px" height="100px"> 
		<input type="radio" name="menu_type" value="중식"> 중식
			<img src="${pageContext.request.contextPath}/resources/img/중식.png" width="100px" height="100px"> 
		<input type="radio" name="menu_type" value="일식"> 일식
			<img src="${pageContext.request.contextPath}/resources/img/일식.png" width="100px" height="100px">
		<input type="radio" name="menu_type" value="양식" > 양식
			<img src="${pageContext.request.contextPath}/resources/img/양식.png" width="100px" height="100px">
		<input type="radio" name="menu_type" value="치킨/피자"> 치킨/피자
			<img src="${pageContext.request.contextPath}/resources/img/피자.png" width="100px" height="100px">
		<input type="radio" name="menu_type" value="분식"> 분식
			<img src="${pageContext.request.contextPath}/resources/img/분식.png" width="100px" height="100px">
		<input type="radio" name="menu_type" value="카페"> 카페 
			<img src="${pageContext.request.contextPath}/resources/img/디저트.png" width="100px" height="100px">
	</div>
		
	<hr>
	
	<div id = "deli3">
	<label for="com.tje.model.FilterView"><h4>가격</h4></label><br>
		<input type="radio" name="menu_price" value="1" checked="checked"> 1만원 이하 
		<input type="radio" name="menu_price" value="2"> 1만원 대
		<input type="radio" name="menu_price" value="3"> 2만원 대 
		<input type="radio" name="menu_price" value="4"> 3만원 ~ 
		<input type="radio" name="menu_price" value="5"> 전체
	</div>
	
	<hr>
	<div id = "deli2">
	<h4>서비스</h4><h6>중복선택가능</h6>
	</div>
	<div id="ck-button">
    	<label>
    	<input type="checkbox" name="service_kidszon" value="true"><span>키즈존</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_pet" value="true"><span>애완동물</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_wipi" value="true"><span>와이파이</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_reservation" value="true"><span>예약</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_takeout" value="true"><span>TakeOut</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_parking" value="true"><span>주차</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_toilet" value="true"><span>남녀화장실구분</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="service_delivery" value="true"><span>배달</span>
	</label>
	</div>
	
	<div id="deli">
	<hr>
	<h4>할인</h4><h6>중복선택가능</h6>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="discount_coupon" value="true"><span>쿠폰할인</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="discount_mobile" value="true"><span>모바일할인</span>
	</label>
	</div>
	<div id="ck-button">
    <label>
    	<input type="checkbox" name="discount_savemoney" value="true"><span>적립금</span>
	</label>
	</div>

	<div id = "search">
	<hr>
	<input type="button" value="취소하기" onclick="layer_close()" class="btn btn-outline-light">
	<input type="submit" class="btn btn-outline-light" value="검색하기">
	</div>	
	</form>

</body>
</html>