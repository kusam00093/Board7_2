package com.board.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.board.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	// 폴더 위치 중요 : 반드시 main() 함수가 있는 클래스의 패키지에 
	// WebMvcConfig.java
	// main() 함수가 있는 클래스(Board6Application.java)의
	// 패키지(com.board) 아래에 .config 를 생성해서 저장
	// con.board.config
	// 용도 : Spring legacy project 는 설정을 .xml애 저장
	//        Spring boot는 
	// 각종 설정 정보를 저장
	@Autowired
	   private  LoginCheckInterceptor   loginCheckInterceptor;
	   
    @Override
        public void addInterceptors(InterceptorRegistry registry) {

	       System.out.println("okokok");
	        registry.addInterceptor( loginCheckInterceptor )
	                .addPathPatterns("/**")      // http://localhost:9090/
	                .addPathPatterns("/**/*")    
	                .excludePathPatterns("/log*","/css/**", "/img/**", "/js/**");
	        
	    }
	
}
