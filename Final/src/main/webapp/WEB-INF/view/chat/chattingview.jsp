<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- <link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap-grid.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap-reboot.css'/>"> --%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<%-- <link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.min.css'/>"> --%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- SocketJS CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>



<script>
 window.onfocus=function(){
 }
 window.onload=function(){
  window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
window.resizeTo(625,950); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
}
</script>


<title>관리자 1:1 채팅 </title>
</head>
<body>


	<c:set var="profile" value='<%=session.getAttribute("login")%>' />

	<!--상단 로고  -->
	<div class="col-12 row justify-content-center align-items-center my-5" style="padding-left: 3.5%" >
		<a href=""><img
			src="${pageContext.request.contextPath}/resources/img/title.jpg""
			alt="Tje Logo" width="180px" class="img-fluid"  /></a>
	</div>
	<div class="col-12">

		<div class="col-2" style="float: left">
			  <input id="file" type="file">
			  <input id="send2"
                type="button" value="파일전송">
		</div>
		<div class="col-8" style="float: left; text-align: center;">
			<strong></strong></div>
		<div class="col-2" style="float: right; padding-left: 5%">
			<button id="closeBtn" onclick="javascript:window.close()">종료</button>
		</div>

	</div>
	<div class="col-12" style="margin-top: 40px; clear: both;">
		<div class="col-10"
			style="margin: 20px auto; text-align: center; color: white; background-color: #9cc9f1; border: 1px solid #9cc9f1; padding: 10px 10px; border-radius: 8px;">
			<strong style="font-size: 14px;">궁금하신 점에 대해 문의해보세요.</strong></div>

	</div>
	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="background:#9cc9f1; margin: 0 auto; border: 1px solid #9cc9f1; height: 500px; border-radius: 3px; overflow: scroll ; border-radius: 8px;"
			id="chatArea">
			<div id="chatMessageArea"
				style="margin-top: 10px;"></div>
		</div>
	</div>

	<div class="well" id="chatdata">
		<!-- User Session Info Hidden -->
		<input type="hidden" value='${loginmember.member_id}'
			id="sessionuserid">
	</div>


	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #9cc9f1; height: 65px; float: left; width: 80% ; font-size: x-large;"
				placeholder="Enter ..." id="message">
				</textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #9cc9f1; border-radius: 5px;">
				<a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold; font-size: 15px;"
				id="sendBtn"><br>전송</a>

			</span>
		</div>
	</div>

	<script type="text/javascript">
	
		var sock = new WebSocket("ws://localhost:8080/Final/echo");
		
		
		sock.onopen = function() {
			appendMessage("연결 되었습니다.");
			console.log('open');
		};
		sock.onclose = function(){
				appendMessage("연결을 끊었습니다.");
				console.log('close');
		};
		
		/* function closeBtn_click(){
			alert('채팅이 종료되었습니다.');
			self.close(); //창닫기
		}; */
		
		sock.onmessage = onMessage;
		
		
		$(function() {
			$("#sendBtn").click(function() {
				console.log('send message...');
				sendMessage();
				$('#message').val('');
			});
			$("#message").keydown(function(key) {
				// 엔터키 입력 감지
				if (key.keyCode == 13) {
					sendMessage();
					$('#message').val('');
				}
			});
		});

		function sendMessage() {
			// 내가 나에게 보내는 메세지 						
			var t = getTimeStamp();
			$("#chatMessageArea")
					.append(
							"<div class='col-12 row' style = 'height : auto; margin-top : 5px; padding-left: 30%;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left; margin-left: 35%'><div class = 'col-12' style = ' background-color:#ffee9a; padding : 15px 5px; float:left; border-radius:10px;word-break: break-all;'><span style = 'font-size : 18px;'>"
									+ "<strong>[ME] -> "
									+ $("#message").val()
									+ "</strong>"
									+ "</span></div><div col-12 style = 'text-align:right; float:right;'><span style ='float:right; font-size:13px; text-align:right;' >"
									+ t + "</span></div></div></div>")
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);

			//websocket으로 메시지를 보내겠다.
			sock.send($("#message").val());

		}

		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}
		
		
		//웹소켓 서버가 보내는 메세지

		function onMessage(evt) { //변수 안에 function자체를 넣음.
			var data = evt.data;
			var message = null;
			var strArray = data;

			for (var i = 0; i < strArray.length; i++) {
				console.log('str[' + i + ']: ' + strArray[i]);
			}

			//current session id//
			var currentuser_session = $('#sessionuserid').val();
			console.log('current session id: ' + currentuser_session);
			message = strArray; //현재 메세지를 저장//

			var t = getTimeStamp();
			$("#chatMessageArea")
					.append(
							"<div class='col-12 row' style = 'height : auto; margin-top : 5px; padding-right: 30%;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left; margin-left: -8%;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 15px 5px; float:left; border-radius:10px;word-break: break-all;'><span style = 'font-size : 18px;'>"
									+ "<strong>"
									+ message
									+ "</strong>"
									+ "</span></div><div col-12 style = ' text-align:right; float:right;'><span style ='float:right; font-size:13px; text-align:right;' >"
									+ t + "</span></div></div></div>")
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);

			console.log('chatting data: ' + data);

		}
		//연결,끊김 등 on,close 에 불리는 메세지
		function appendMessage(msg) {

			if (msg == '') {
				return false;
			} else {

				var t = getTimeStamp();
				$("#chatMessageArea")
						.append(
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left; margin: auto;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 15px 5px; float:left; border-radius:10px; text-align: center; word-break: break-all;'><span style = 'font-size : 18px;'>"
										+ "<strong>" + msg + "</strong>"
										+ "</span></div><div col-12 style = 'text-align:right; float:right;'><span style ='float:right; font-size:13px; text-align:right;' >"
										+ t + "</span></div></div></div>")

				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);

			}
		}
		
		 function send(){
	         wsocket.send($("#message").val());
	         }
		
		//파일전송
        document.getElementById("send2").addEventListener("click", sendFile, false);
		
        function sendFile(){
            var file = document.getElementById('file').files[0];
            sock.send('filename:'+file.name);
            alert('파일전송 테스트');
            
            
            var reader = new FileReader();
            var rawData = new ArrayBuffer(); 
           
            reader.loadend = function() {
           
            }
            
            reader.onload = function(e) {
            rawData = e.target.result;
            sock.send(rawData);
            alert("파일 전송이 완료 되었습니다.")
       //     sock.send('end');
            }
           
            reader.readAsArrayBuffer(file);
           }
            
    //        window.addEventListener("load", connect, false);
		
		
	</script>

</body>
</html>
