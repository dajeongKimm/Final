package com.tje.websocket;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.*;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;
//import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tje.model.Member;


public class EchoHandler extends AbstractWebSocketHandler {

	// 어드민을 담기위한 리스트 대기중인 관리자들을 리스트에 저장
	private List<WebSocketSession> adminList = new LinkedList<>();
	// 대기중인 일반 멤버들
	private Map<String, WebSocketSession> waitMemberMap = new HashMap<>();
	// 연결된 어드민과 유저를 담을 MAP 
	// 키(key) 값(value)
	// 세션id, 웹소켓 객체
	// C_ID , A_WS
	// A_ID , C_WS
	private Map<String, WebSocketSession> connectionMap = new HashMap<>();
	
	// 파일 저장경로
    String path = "C:\\dev\\java_ee\\sources\\Final\\src\\main\\";
    String filename = null;

//	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	/**
	 * 클라이언트 연결 이후에 실행되는 메소드
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// 맵 방식
		// 1. 들어온 사람의 실제 로그인 아이디 정보를 가저온다.
		Map<String, Object> map = session.getAttributes();
		// map 에 저장 되어 있는 키값을 가저와 mem에 대입
		Member mem = (Member) map.get("loginmember");

		// 세션에 저장된 값이 없는 사람이 (loginmember 세션이 없는경우)
		// 억지로 url을 통해 접속했을 경우
		// session을 닫음 바로 연결끊김
		if (mem == null) {
			session.close();
			return;
		}
		// id 변수에 loginMember에 대한 키값의 벨류인 getMember_id 를 통해
		// 맵에 저장 되어 있는 세션의 아이디 값을 가저온다.
		// loginmember.member_id 를 가저오게됨 abc라는 유저가 채팅에 접속했을 경우
		// abc라는 값을 아래 String id에 저장
		String id = mem.getMember_id();
		// 어드민 1 / 일반 회원 0
		int memberType = mem.getMember_type();

		System.out.printf("멤버 아이디 - %s, 멤버 타입 - %d\n", id, memberType);

		// 멤버 타입이 어드민일 경우
		if (memberType == 1) {
			// 대기중인 adminList 에 관리자 추가
			adminList.add(session);
			System.out.printf("연결된 어드민 ID : %s, 연결된 어드민수 : %d\n", id, adminList.size());
			System.out.println("커넥션 session 무엇 :" + session.getId());

			// 대기중인 멤버가 있을경우 대기중인 멤버들에게 메세지 전송
			if (waitMemberMap.size() > 0) {
				Iterator<String> waitIds = waitMemberMap.keySet().iterator();
				String waitId = "";
				while (waitIds.hasNext()) {
					waitId = waitIds.next();
					waitMemberMap.get(waitId)
							.sendMessage(new TextMessage("현재 관리자와 상담이 가능합니다. <a href=\"ws-echo\">재연결</a>"));
				}
			}

			// 멤버 타입이 일반 유저 일 경우
		} else if (memberType == 0) {
			// adminList 크기가 0 보다 클 경우
			if (adminList.size() > 0) {
				// 맵에 session < 키: 클라이언트의 세션 아이디 , 값 : adminList의 0번째 인덱스의 웹소켓 세션
				connectionMap.put(session.getId(), adminList.get(0));
				// 키 : adminList의 0번째 인덱스 아이디 , 클라이언트의 세션 웹소켓
				connectionMap.put(adminList.get(0).getId(), session);
				
				
				// 맵에 저장된 키와 벨류 를 불러오는 entrySet
				// 키와 값을 확인하기 위해 작성  
				for (Map.Entry<String, WebSocketSession> elem : connectionMap.entrySet()) {
					System.out.println(String.format("키 : %s, 값 : %s ", elem.getKey(), elem.getValue()));
				}
				
				// 어드민과 연결 되었을때 클라이언트에게 메세지
				session.sendMessage(new TextMessage("관리자와 연결되었습니다."));
				// 클라이언트와 연결 되었을때 관리자에게 메세지
				// 어드민 리스트에서 0번째 index을 가저와 그 웹소켓에게 메세지 전송
				adminList.get(0).sendMessage(new TextMessage("[" + id + "] 님과 연결되었습니다."));
				// adminList 의 0번째 인덱스를 지워줌 위에 connectionMap에 저장했기 때문에
				adminList.remove(0);

			} else {
				// 위에 조건들이 충족되지 않을경우
				// 채팅이 가능한 어드민이 없다 가정
				// waitMemberMap 에 멤버를 넣어줌
				waitMemberMap.put(session.getId(), session);
				for (Map.Entry<String, WebSocketSession> elem : waitMemberMap.entrySet()) {
					System.out.println(String.format("wait키 : %s, wait값 : %s ", elem.getKey(), elem.getValue()));
				}
				session.sendMessage(new TextMessage("대화할 수 있는 관리자가 존재하지 않습니다."));
				session.sendMessage(new TextMessage("잠시 뒤에 접속해 주세요."));
			}
		}
	}

	/**
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		//afterConnectionEstablished에 설명있음
		// 세션에 저장된 실제 멤버 id와 type 을 가저오기 위함
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member) map.get("loginmember");
		String id = mem.getMember_id();
		int memberType = mem.getMember_type();

		//target은 자기와 연결된 상대방의 웹소켓 세션을 conneciontMap에서 가저옴
		WebSocketSession target = connectionMap.get(session.getId());
		
		
		 System.out.println();
	        System.out.println("handleTextMessage");    
	        System.out.println("msg : " + message.toString());
	        System.out.println("getPayload : " + message.getPayload());
	        System.out.println("getPayloadLength : " + message.getPayloadLength());
//	        System.out.println("asBytes to String : " + new String(message.asBytes()));
	        System.out.println();
		
		
		
		
		//멤버와 관리자의 메세지 보냄을 구분하기 위함 
		// 대화할 상대방이 있을경우
		if(target != null) {
			// 멤버 타입이 관리자
			if (memberType == 1) {
				// 파일 이름전송
				 if(message.getPayload().startsWith("filename:")){
			            filename = message.getPayload().split(":")[1];
			        }
				
			target.sendMessage(new TextMessage("[관리자] ->" + message.getPayload()));
			// 멤버 타입 일반멤버
			} else if (memberType == 0) {
				// 파일 이름전송
				 if(message.getPayload().startsWith("filename:")){
			            filename = message.getPayload().split(":")[1];
			        }
				target.sendMessage(new TextMessage("[" + id + "]->" + message.getPayload()));

			}
			// 없을경우 메소드 종료 
		}else {
			return;
		}
	}
	
	 /**
     * 파일 업로드
     * 기본 버퍼 사이즈가 8192바이트 인데 초기 설정 때 버퍼사이즈를 정해 줄 수 있다.
     * 버퍼 사이즈를 넘어가게 되면 웹소켓은 close 된다.
     */

    @Override
    protected void handleBinaryMessage(WebSocketSession session,
            BinaryMessage message) {

        System.out.println();
        
        System.out.println("handleBinaryMessage : " + message);        
        ByteBuffer payload = message.getPayload();
        System.out.println(message.getPayloadLength());
        System.out.println();
        
        File file = new File(path+filename);
        
        try(
                BufferedOutputStream bos = 
                    new BufferedOutputStream(new FileOutputStream(file))
                ){

            while(payload.hasRemaining()){
                bos.write(payload.get());
            }
        
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }

	/**
	 * 클라이언트 연결을 끊었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// 1. 들어온 사람의 실제 로그인 아이디 정보를 가저온다.
		Map<String, Object> map = session.getAttributes();
		// map 에 저장 되어 있는 키값을 가저와 mem에 대입
		Member mem = (Member) map.get("loginmember");
		int memberType = mem.getMember_type();
		// 사용자가 종료를 하면 요청한 클라이언트 웹소켓 세션
		// 웹소켓 세션에는 connectionMap에 있는 session의 id의(key) 값(value)을 가저옴 (abc란 키 값을
		// 가진클라이언트가 요청시)
		// ex) abc 라는 키(key)값에 저장된 클라이언트의 웹소켓 세션 값(value)을 가저옴 target 변수에 저장
		WebSocketSession target = connectionMap.get(session.getId());
		
		System.out.println("테스트 타겟 : " + target);
		System.out.println("테스트 세션 : " + session.getId());
		System.out.println("커넥션맵에 세션 아이디 :" + connectionMap.get(session.getId()));
		System.out.println("웹소켓에 종료 요청한 세션 아이디 :" + session);

		// waitMemberMap에 있는 session.id를 통해 벨류에 있는 웹소켓 값을 가저옴
		WebSocketSession waitTarget = waitMemberMap.get(session.getId());

		System.out.println("waitTarget = " + waitTarget);
		// 대기중인 멤버가 재접속 누를시에 세션 삭제
		// 멤버이며 웹소켓 세션 id 가 waitTarget과 같을때 실행
		if (memberType == 0 && session.equals(waitTarget)) {
			waitMemberMap.remove(session.getId());
			System.out.println("대기중인 멤버 세션 삭제 : " + session.getId());
			return;
		}


		
		// 웹소켓 세션을 종료하는 사람이 일반 유저일 경우
		if (memberType == 0) {
			try {
				System.out.println("target.getId 는 널값 :"+target);
				
				// 상대방 웹소켓이 null값이 아닐경우에 
				// 나와 상대방 웹소켓 삭제
				if (target.getId() != null) {
					connectionMap.remove(session.getId());
					connectionMap.remove(target.getId());
					//관리자에게는 클라이언트와 종료 되었다는 메세지 전송
					target.sendMessage(new TextMessage("클라이언트와의 연결이 종료되었습니다. <a href=\"ws-echo\">재접속</a>"));
				} else {
					// target이 null값인 경우 이미 상대방측이 먼저 연결을 끊음
					// 그렇기에 메소드 종료
					System.out.println("멤버 측 종료 후 리턴");
					return;
				}
				
				System.out.println("memberType == 0 세션:" + session.getId());
				System.out.println("memberType == 0 타겟:" + target.getId());
				System.out.println("타겟 :" + target);
				
				for (Map.Entry<String, WebSocketSession> elem : connectionMap.entrySet()) {
					System.out.println(String.format("키 : %s, 값 : %s ", elem.getKey(), elem.getValue()));
				}
				System.out.println("connection맵에  없네~");
				
			} catch (NullPointerException e) {
				System.out.println("target이 널값 신경 ㄴ");
				e.printStackTrace();

			}

			// 어드민일 경우
		} else if (memberType == 1) {
			// 혼자 소켓을 종료할 경우
			// 관리자가 혼자 채팅을 종료한 경우 adminList에는 자신이 있기 때문에 
			// 사이즈가 0보다 크고 상대방이 없는경우 아래 조건문 실행
			if (adminList.size() > 0 && target == null) {
				// 내 자신의 세션을 지움
				adminList.remove(session);
				int count = 0;
				for (WebSocketSession session1 : adminList) {
					System.out.println(count + "번째 세션 값 :" + session1);
					count++;
				}
				System.out.println(adminList.size());
				/*
				 * // 어드민 웹소켓 1번째 인덱스 값 삭제 하고
				 * WebSocketSession admin = adminList.remove(0);
				 * //클라이언트와 어드민 세션 맵에 추가 
				 * // 재연결 여기서 target은 상대 클라이언트 즉 유저
				 * // admin은 대기중인 새로운 관리자가
				 * 클라이언트와 연결 connectionMap.put(target.getId(), admin);
				 * connectionMap.put(admin.getId(), target); admin.sendMessage(new
				 * TextMessage("["+target+"] 님과 연결되었습니다. 연결되었습니다.")); target.sendMessage(new
				 * TextMessage("새로운 관리자와 연결되었습니다."));
				 */
				
				//어드민이 상대방과 대화중일때 종료한 경우
			} else {
				try {
					System.out.println("target.getId 는 널값 :"+target);
					
					//상대 방이 있으면 맵에 객체를 자신과 상대방 모두 지움
					if (target.getId() != null) {
						connectionMap.remove(session.getId());
						connectionMap.remove(target.getId());
						// 상대방에게 메세지 전송
						target.sendMessage(new TextMessage("관리자와의 연결이 종료되었습니다."));
						// 상대방이 종료후 나 혼자 남아있을 경우
					} else {
						System.out.println("어드민측 리턴 ");
						return;
					}
					System.out.println("memberType == 1 타겟:" + target.getId());
					System.out.println("memberType == 1 세션:" + session.getId());
					System.out.println("adminList 세션 삭제 후 리스트 사이즈 : " + adminList.size());
					System.out.println("타겟 :" + target);
					System.out.println("conMap 사이즈 :" + connectionMap.size());
					
					for (Map.Entry<String, WebSocketSession> elem : connectionMap.entrySet()) {
						System.out.println(String.format("키 : %s, 값 : %s ", elem.getKey(), elem.getValue()));
					}
					
					System.out.println("어드민 connection맵에  없네~");
					
				} catch (NullPointerException e) {
					System.out.println("target이 널값 신경 ㄴ");
					e.printStackTrace();
				}
			}
		}
	}
}
