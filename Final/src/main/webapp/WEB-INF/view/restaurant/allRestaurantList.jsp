<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>전체 음식점</title>

<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>


<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">

<style>
	#list{
		margin:50px;
		width: 800px;
		height: 100%;
		float: left;
	}
	#footer{
		clear: both;
	}
	#map{
		margin-top:30px;
	}
	#listandmap{
		width:1500px; margin: 0 auto; background: rgba(0,0,0,0,2);
	}
	#pasing{
		clear: both;
	}
	
</style>
</head>
<body>

	<jsp:include page="/indexHeader.jsp"/>

	<div id="listandmap">
	<div id="list">
	
	<table class="table table-hover">
	<caption>전체 음식점</caption>
	<c:forEach var="restaurant" items="${allRestaurantList}" varStatus="status">
		<tr onmouseover="mouseOver('${restaurant.restaurant_name}', ${restaurant.map_coordinate_lat}, ${restaurant.map_coordinate_long})" onmouseout="mouseOut()">
			<td rowspan="2" width="10px">${restaurant.restaurant_id}</td>
			<td rowspan="2" width="150px;">
				<img src="${pageContext.request.contextPath}/resources/${restaurant.restaurant_mainimage}" width="100px" height="100px" />
			</td>
			<td colspan="2">
				<a href="${pageContext.request.contextPath}/allRestaurantList/${restaurant.restaurant_id}">
					<h4>${restaurant.restaurant_name}</h4>
				</a>
			</td>
			<td style="text-align: right;" colspan="3">
				<c:if test="${ restaurant.sum_score eq 0}" var = "test" >
				<h4 style="color:orange">
					0.0
				</h4>
				</c:if>
				<c:if test = "${not test }">
				<h4 style="color:orange">
				<fmt:formatNumber value="${restaurant.sum_score / restaurant.allcount}"  pattern="0.0"/>	
				</h4>	
				</c:if>
			</td>
			<td style="text-align: right;">
				<img src="${pageContext.request.contextPath}/resources/img/eye.png" width="13px" height="13px">&nbsp;&nbsp;${restaurant.read_count}
			</td>
		</tr>
		<tr>
			<td colspan="7">${restaurant.restaurant_description}</td> 
		</tr>
		</c:forEach>
	</table>
	</div>
	
	<!-- 지도만들기  -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d0a9c08b9476a9a60e5027f02a4d3fc&libraries=services"></script>
	<div id="map" style="width:500px;height:500px;position:relative;"></div>
	<script>
	var container = document.getElementById('map');  //지도를 표시할 div
	var options = {
		center: new daum.maps.LatLng(37.56990650932339, 126.98441584630537), //지도의 중심좌표 ->종각역으로 표시
		level: 3 //지도의 확대 레벨
	};
	
	//지도를 표시할 div와 지도 옵션으로 지도를 생성
	var map = new daum.maps.Map(container, options);

	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
		
	var positions = [
		{
	    	content :'<div>제레미20 종로타워점</div>',
	        latlng: new daum.maps.LatLng(37.57050108902525, 126.98384125205018)
	    },
	    {
	    	content :'<div>종로불돼지</div>',
	        latlng: new daum.maps.LatLng(37.568861444049865, 126.98510937515448)
	    },
	    {
	    	content :'<div>스타벅스 종각점</div>',
	        latlng: new daum.maps.LatLng(37.569978609398156, 126.9845714748773)
	    },
	    {
	    	content :'<div>떡삼시대 본점</div>',
	        latlng: new daum.maps.LatLng(37.56946495283661, 126.9839037329028)
	    },
	    {
	    	content :'<div>채선당M 종로점</div>',
	        latlng: new daum.maps.LatLng(37.56905276851474, 126.9840594632708)
	    },
	    {
	    	content :'<div>이트피자 종로점</div>',
	        latlng: new daum.maps.LatLng(37.568874886241225, 126.98454340412312)
	    },
	    {
	    	content :'<div>롤링파스타</div>',
	        latlng: new daum.maps.LatLng(37.56928486789846, 126.98476404827146)
	    },
	    {
	    	content :'<div>아딸</div>',
	        latlng: new daum.maps.LatLng(37.569933740425036, 126.98602321351581)
	    },
	    {
	    	content :'<div>바른식 시골보쌈&감자옹심이 종로관철점</div>',
	        latlng: new daum.maps.LatLng(37.569104840931345, 126.98616203107832)
	    },
	    {
	    	content :'<div>북경반점</div>',
	        latlng: new daum.maps.LatLng(37.56862502626838, 126.98587064711478)
	    },
	    {
	    	content :'<div>토속마을 종각점</div>',
	        latlng: new daum.maps.LatLng(37.5705957625289, 126.98435344474242)
	    },
	    {
	    	content :'<div>초밥집</div>',
	        latlng: new daum.maps.LatLng(37.57077568326556, 126.9823781273504)
	    },
	    {
	    	content :'<div>민들레영토 종로2가점</div>',
	        latlng: new daum.maps.LatLng(37.57058015184476, 126.98558445724625)
	    }
	];
	
	//마커 이미지
	var imageSrc = 'http:/Final/resources/img/logo.png', // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(40,40), // 마커이미지의 크기입니다
		imageOption = {offset: new daum.maps.Point(25, 35)}; //마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	
	for (var i = 0; i < positions.length; i ++) {
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = positions[i].latlng //마커가 표시될 위치
		
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: markerPosition, // 마커의 위치
	        image: markerImage // 마커이미지 설정
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new daum.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

	}
	
	//목록의 이름을 mouseover 했을 때 검색결과
	function mouseOver(title, mapLat, mapLong){
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new daum.maps.LatLng(mapLat, mapLong) //마커가 표시될 위치
		
		var marker = new daum.maps.Marker({
			map: map,
			position : markerPosition,
			image: markerImage // 마커이미지 설정
		});
	    displayInfowindow(marker, title);
	}
	//목록이름 mouseover했을 때 불리는 함수
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	//목록을 moseout 했을 때 불리는 함수
	function mouseOut(){
		infowindow.close();
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	//현위치
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new daum.maps.LatLng(37.56990650932339, 126.98441584630537),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = locPosition //마커가 표시될 위치

	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({  
	        map: map, 
	        position: markerPosition,
	        image: markerImage // 마커이미지 설정
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    

	</script>
	</div>
	
	
<!-- 페이징 처리 -->
<div id="pasing" style="text-align: center">
	<ul class="pagination pagination-sm">
	<c:if test="${ page != 1 }">	
		<li><a href="${pageContext.request.contextPath}/allRestaurantList">처음</a></li>
	</c:if>	

	<c:if test="${ startPage != 1 }">	
		<li><a href="${pageContext.request.contextPath}/allRestaurantList?page=${startPage-1}">이전</a></li>
	</c:if>		

	<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
		<c:if test="${ i == page }" var="result">	
			<li><a href="${pageContext.request.contextPath}/allRestaurantList?page=${i}"><b>${ i }</b></a></li>
		</c:if>			
		<c:if test="${ not result }">	
			<li><a href="${pageContext.request.contextPath}/allRestaurantList?page=${i}">${ i }</a></li>
		</c:if>			
	</c:forEach>

	<c:if test="${ endPage != totalPage }">	
		<li><a href="${pageContext.request.contextPath}/allRestaurantList?page=${endPage+1}">다음</a></li>
	</c:if>	

	<c:if test="${ page != totalPage }">	
		<li><a href="${pageContext.request.contextPath}/allRestaurantList?page=${totalPage}">끝</a></li>
	</c:if>	
	</ul>	
</div>
	

	<jsp:include page="/indexFooter.jsp"/>


</body>
</html>