package com.min.edu.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
public class LogAdvice {
	
	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("~~~~~~~~~~~~~~~~ Method 실행 전 ~~~~~~~~~~~~~~~~");
		
		Object [] obj = j.getArgs();
		
		if(obj!=null) {
			logger.warn("");
		}
	}
	

}
