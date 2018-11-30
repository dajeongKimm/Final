package com.tje.websocket;

import com.tje.websocket.EchoHandler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
@Controller
public class WebSocketConf implements WebSocketConfigurer{

    /**
     * 웹소켓 핸들러 등록
     * registry 에 매핑 url과 인터셉터로 사용할 클래스를 등록한다.
     */
	
	// 채팅 
	@RequestMapping("/ws-echo")
	public String echo_ws(HttpSession session, HttpServletRequest request) {
		session = request.getSession(false);
		System.out.println("세션 정보 :"+session.getAttribute("loginmember"));
		
		if(session.getAttribute("loginmember") != null) {
			return "chat/chattingview";
		}else {
			return "member/loginForm";
		}
		
	}

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(echoHandler(), "/echo")
            .addInterceptors(new HttpSessionHandshakeInterceptor());
        
        
    }

    /**
     * 웹소켓 서버로 사용할 클래스를 등록
     * @return
     */

    @Bean
    public EchoHandler echoHandler(){
        return new EchoHandler();
    }
    
    /**
     * 웹소켓 버퍼 사이즈 설정
     * 기본 설정은 text, binary 버퍼 크기가 8192 byte 이다
     * @return
     */

    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer(){
        
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        
        container.setMaxBinaryMessageBufferSize(2*1024*1024);
        container.setMaxTextMessageBufferSize(8192);
        
        return container;
        
        
        
    }
}