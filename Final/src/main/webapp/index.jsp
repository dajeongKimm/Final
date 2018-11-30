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
<title>더조은 미슐렝: 테마별 맛집 추천</title>

<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>

<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo.png"> 

</head>
<body>

	<jsp:include page="/indexHeader.jsp"/>
	
	<main>
	<section id="contents">
		<div class="container">
			<table class="foodimg">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/best/rank"> 
						<img src=resources/img/1.png width=360px height=360px class="img-thumbnail"></a>
						
					<td>
						<a href="${pageContext.request.contextPath}/best/score"> 
						<img src=resources/img/2.png width=360px height=360px class="img-thumbnail"></a>
					<td>
						<a href="${pageContext.request.contextPath}/best/review"> 
						<img src=resources/img/3.png width=360px height=360px class="img-thumbnail"></a>			
				</tr>
				
				<tr>
					<td>
						<a href="#"> 
						<img src=resources/img/4.jpg width=360px height=360px class="img-thumbnail"></a>
					<td>
						<a href="#"> 
						<img src=resources/img/5.jpg width=360px height=360px class="img-thumbnail"></a>
					<td>
						<a href="#"> 
						<img src=resources/img/6.jpg width=360px height=360px class="img-thumbnail"></a>
				</tr>
			</table>
		</div>
	</section>
	</main>
	
	<jsp:include page="/indexFooter.jsp"/>
	
</body>
</html>
