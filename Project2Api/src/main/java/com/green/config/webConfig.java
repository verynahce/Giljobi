package com.green.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class webConfig implements WebMvcConfigurer{

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		
		
		WebMvcConfigurer.super.addCorsMappings(registry);
		registry.addMapping("/**").allowedOriginPatterns("*") // *  : 모든 pattern
		        .allowedMethods("GET","POST","PATCH","DELETE") //CORS 허용 METHOD 목록
		        .allowCredentials(true); //쿠키 인증허용
	}

	
	
}
