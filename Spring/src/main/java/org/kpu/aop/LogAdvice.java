package org.kpu.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.kpu.myweb.domain.RecipeVO;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
@Aspect
public class LogAdvice {

    private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);

    @Around("execution(* org.kpu.myweb.persistence.RecipeDAOImpl.search(..))")
    public Object logPrint(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        long start = System.currentTimeMillis();

        Object result = proceedingJoinPoint.proceed();

        String type = proceedingJoinPoint.getSignature().getDeclaringTypeName();

        long end = System.currentTimeMillis();
        logger.info( type + "."+proceedingJoinPoint.getSignature().getName() + "()");
        logger.info("Argument/Parameter : " + Arrays.toString(proceedingJoinPoint.getArgs()));
        logger.info("Running Time : " + (end-start));
        logger.info("----------------------------------------------------------------");

        return result;
    }

}
