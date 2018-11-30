<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
	function openChatting(url){
		window.open(url,"관리자와 1:1 채팅",  "width=600, height=750");
	}
</script>

<script type="text/javascript">
	//필터 열기
	function fn_layer_popup(){ 
		var layer = document.getElementById("popup_layer"); 
		layer.style.visibility="visible";
	} 
	//필터 닫기
	function layer_close(){
		var layer = document.getElementById("popup_layer");
		layer.style.visibility="hidden"
	}
	//최근방문 열기
	function search_layer_popup(){ 
		var layer = document.getElementById("searchListPopup_layer"); 
		layer.style.visibility="visible";
	} 
	//최근방문 닫기
	function search_layer_close(){
		var layer = document.getElementById("searchListPopup_layer");
		layer.style.visibility="hidden"
	}
	//급상승 검색어 열기
	function rank_layer_popup(){ 
		var layer = document.getElementById("rankPopup_layer"); 
		layer.style.visibility="visible";
		
	} 
	//급상승 검색어 닫기
	function rank_layer_close(){
		var layer = document.getElementById("rankPopup_layer");
		layer.style.visibility="hidden"
	}	
	 
</script>


<header id=header>
	<div class="container">
		<div class="quick">
			<c:if test="${loginmember eq null}">
				<a href="${pageContext.request.contextPath}/member/login">Login</a>
				<a href="${pageContext.request.contextPath}/member/insert">Sing Up</a>
			</c:if>
			<c:if test="${loginmember ne null}">
				<a href="${pageContext.request.contextPath}/member/logout">Logout</a>
				<a href="${pageContext.request.contextPath}/member/myPage">My Page</a>
				<a href="#" onclick="openChatting('${pageContext.request.contextPath}/ws-echo')" >1:1 채팅</a>
				<a class = "searchList" onclick="search_layer_popup()"><i class="fa fa-user-o" aria-hidden="true"></i></a>
			</c:if>
				<a  onclick="rank_layer_popup()" >검색어 순위</a>
			<!-- 최근방문기록 -->
			<div id="searchListPopup_layer" 
         		style="position:fixed; border:solid 3px gray; top:30px; right:10px; width:280px; height:550px;  visibility:hidden;  background-color:white; text-align: left;"> 
				<input type="button" value="닫기" onclick="search_layer_close()" class="btn btn-outline-light">
				<iframe src="${pageContext.request.contextPath}/visit" width="270px" height="500px" frameborder=0></iframe> 	
			</div>
			
			<!-- 급상승 검색어 -->
			<div id="rankPopup_layer" 
         		style="position:fixed; border:solid 3px gray; top:600px; right:10px; width:280px; height:300px;  visibility:hidden;  background-color:white; text-align: left;"> 
				<input type="button" value="닫기" onclick="rank_layer_close()" class="btn btn-outline-light">
				<iframe src="${pageContext.request.contextPath}/search/rank" width="270px" height="250px" frameborder=0></iframe>   	
			</div>
		
			<div class="title">
				<p>
				<a href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/img/title.jpg" width=25%></a>
				</p>
			</div>
		
			<!-- 검색창 -->
		 	<div class="main-search-bar">
         		<form action="${pageContext.request.contextPath}/search">
            	<fieldset>
               		<input type="text" name="keyword" size="30" placeholder="음식점 이름을 검색하세요">
               		<button type="submit">
                 	<i class="fa fa-search"></i>
               		</button>
            	</fieldset>
            	<!-- 필터 -->
         		<a class = "filter" onclick="fn_layer_popup()"><i class="fa fa-filter" aria-hidden="true"></i></a>
         		</form>
      		</div>   
  						
  			<!-- 필터창 -->
			<div id="popup_layer" 
				style="position:fixed; border:solid 3px gray; top:100px; left:100px; width:590px; height:630px;  visibility:hidden;  background-color:white; text-align: left; padding: 10px"> 
				<jsp:include page="/WEB-INF/view/restaurant/filterForm.jsp" />
			</div> 
		
			<br><br>
		
			<div class="foodtype">
				<ul>
					<li><a href="${pageContext.request.contextPath}/allRestaurantList">전체</a></li>
					<li><a href="${pageContext.request.contextPath}/allChikenAndPizzaList">치킨/피자</a></li>
					<li><a href="${pageContext.request.contextPath}/allYangsikList">양식</a></li>
					<li><a href="${pageContext.request.contextPath}/allJungsikList">중식</a></li>
					<li><a href="${pageContext.request.contextPath}/allHansikList">한식</a></li>
					<li><a href="${pageContext.request.contextPath}/allIlsikList">일식</a></li>
					<li><a href="${pageContext.request.contextPath}/allBunsikList">분식</a></li>
					<li><a href="${pageContext.request.contextPath}/allCafeList">디저트</a></li>
					<li><a href="#">전체리뷰</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>



