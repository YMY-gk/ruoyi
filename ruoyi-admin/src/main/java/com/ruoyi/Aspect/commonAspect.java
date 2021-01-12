package com.ruoyi.Aspect;
 import com.alibaba.fastjson.JSONObject;
 import com.ruoyi.common.utils.ServletUtils;
 import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.formula.functions.T;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 import org.springframework.stereotype.Component;
 import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @descriptions TODO
 * @author guokui
 * @date $ $
 */
@Aspect
@Component
public class commonAspect {

    public static final Logger log = LoggerFactory.getLogger(commonAspect.class);
    /**
     * ..表示包及子包 该方法代表controller层的所有方法  TODO 路径需要根据自己项目定义
     */
    @Pointcut("execution(public * com.ruoyi.*.*Controller.*(..))")
    public void controllerMethod() {
    }


    /**
     * 方法执行前
     *
     * @param joinPoint
     * @throws Exception
     */
    @Before("controllerMethod()")
    public void LogRequestInfo(JoinPoint joinPoint) throws Exception {
        HttpServletRequest request = ServletUtils.getRequest();
        StringBuilder requestLog = new StringBuilder();
        Signature signature = joinPoint.getSignature();
        Object[] args =joinPoint.getArgs();
        try {
            requestLog.append(((MethodSignature) signature).getMethod().getAnnotation(ApiOperation.class).value()).append("\t")
                    .append("请求信息：").append("URL = {").append(request.getRequestURI()).append("},\t")
                    .append("请求方式 = {").append(request.getMethod()).append("},\t")
                    .append("请求IP = {").append(request.getRemoteAddr()).append("},\t")
                    .append("类方法 = {").append(signature.getDeclaringTypeName()).append(".")
                    .append(signature.getName()).append("},\t");
        }catch (Exception a){

        }

        // 处理请求参数
        String[] paramNames = ((MethodSignature) signature).getParameterNames();
        Object[] paramValues = joinPoint.getArgs();
        int paramLength = null == paramNames ? 0 : paramNames.length;
        if (paramLength == 0) {
            requestLog.append("请求参数 = {} ");
        } else {
            requestLog.append("请求参数 = [");
            for (int i = 0; i < paramLength - 1; i++) {
                requestLog.append(paramNames[i]).append("=").append(JSONObject.toJSONString(paramValues[i])).append(",");
            }
            requestLog.append(paramNames[paramLength - 1]).append("=").append(JSONObject.toJSONString(paramValues[paramLength - 1])).append("]");
        }

       log.info(requestLog.toString());
    }
    /**
     * 方法执行后
     *
     * @param
     * @throws Exception
     */
    @AfterReturning(returning = "resultVO", pointcut = "controllerMethod()")
    public void logResultVOInfo(T resultVO) throws Exception {
        log.info(resultVO.toString());
    }
}
