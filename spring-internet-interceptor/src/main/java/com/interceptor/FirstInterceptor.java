package com.interceptor;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstInterceptor implements HandlerInterceptor {

  /*  @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler)
            throws Exception {
        if (request.getSession().getAttribute("name") ==null){
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request,response);
            return false;
        }
        System.out.println("preHandle:请求前调用");
       // log.info("preHandle:请求前调用");
        //返回 false 则请求中断
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle:请求后调用");
        //log.info("postHandle:请求后调用");
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("afterCompletion:请求调用完成后回调方法，即在视图渲染完成后回调");
        //log.info("afterCompletion:请求调用完成后回调方法，即在视图渲染完成后回调");
    }
*/
}
