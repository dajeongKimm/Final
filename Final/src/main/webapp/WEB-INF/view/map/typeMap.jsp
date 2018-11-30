<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 음식 타입별 지도만들기  -->
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
	
	var infowindow = null;
	//마커 이미지
	var imageSrc = 'http:/Final/resources/img/logo.png', // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(40,40), // 마커이미지의 크기입니다
		imageOption = {offset: new daum.maps.Point(25, 35)}; //마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	//목록의 이름을 mouseover 했을 때 검색결과
	function mouseOver(title, mapLat, mapLong){
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new daum.maps.LatLng(mapLat, mapLong); //마커가 표시될 위치
		
		var marker = new daum.maps.Marker({
			map: map,
			position : markerPosition,
			image: markerImage // 마커이미지 설정 
		});
		
		infowindow = new daum.maps.InfoWindow({
	        content: title // 인포윈도우에 표시할 내용
	    });
		
	    displayInfowindow(marker, title, infowindow);
	}
	
	//목록이름 mouseover했을 때 불리는 함수
	function displayInfowindow(marker, title, infowindow) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	
	//목록을 moseout 했을 때 불리는 함수
	function mouseOut(){
		if(infowindow != null){
			infowindow.close();
			infowindow = null;
		}
	}
	
</script>