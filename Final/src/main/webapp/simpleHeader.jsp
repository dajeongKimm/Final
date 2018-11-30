<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



 


<header id=header>
	<div class="container">
		<div class="quick">
			<c:if test="${loginmember eq null}">
				<a href="${pageContext.request.contextPath}/member/login">Login</a>
				<a href="insertForm">Sing Up</a>
			</c:if>
			<c:if test="${loginmember ne null}">
				<a href="#">Logout</a>
				<a href="#">My Page</a>
				<a href="${pageContext.request.contextPath}/ws-echo">관리자와 채팅</a>
			</c:if>
		</div>
		<nav id="topMenu"><div class ="sub-title">
		<a href="${pageContext.request.contextPath}"><img
			src="resources/img/title.jpg" height="50px"></a>
		</div>
			<ul>
				<li class="topMenuLi"><a class="menuLink" href="#">필터1</a>
					<ul class="submenu">
						<li><a class="submenuLink longLink">1</a></li>
						<li><a class="submenuLink longLink">2</a></li>
						<li><a class="submenuLink longLink">3</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="#">필터2</a>
					<ul class="submenu">
						<li><a class="submenuLink longLink">1</a></li>
						<li><a class="submenuLink longLink">2</a></li>
						<li><a class="submenuLink longLink">3</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="#">필터3</a>
					<ul class="submenu">
						<li><a class="submenuLink longLink">1</a></li>
						<li><a class="submenuLink longLink">2</a></li>
						<li><a class="submenuLink longLink">3</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="#">필터4</a>
					<ul class="submenu">
						<li><a class="submenuLink longLink">1</a></li>
						<li><a class="submenuLink longLink">2</a></li>
						<li><a class="submenuLink longLink">3</a></li>
					</ul></li>
			</ul>

			<div class="main-search-bar">
				<form onsubmit="searchPlaces(); return false;">
					<fieldset>
						<input type="text" id="keyword" size="30">
						<button type="submit"
							onclick="${pageContext.request.contextPath}/member/main">
							<i class="fa fa-search"></i>
						</button>
						<!--  다른 검색창 - 기존에 있던거
					<input id="main-search" name="main-search" type="text">
					<input class="btn-search" type="submit" value="검색" onclick="search();">
				-->
					</fieldset>

				</form>
		</nav>
	</div>
	<br> 
	<div class="foodtype">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/allRestaurantList">전체</a></li>
			<li><a href="#">치킨</a></li>
			<li><a href="#">양식</a></li>
			<li><a href="#">중식</a></li>
			<li><a href="allHansikList">한식</a></li>
			<li><a href="#">일식</a></li>
			<li><a href="#">분식</a></li>
			<li><a href="#">디저트</a></li>
			<li><a href="#">전체리뷰</a></li>
		</ul>
	</div>
	</div>
</header>

