package com.baizhi.cache;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.Configuration;

@Configuration
@Aspect
public class RedisCache {

    @Around("execution(* com.baizhi.service.*.select*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint){
        return null;
    }
}
