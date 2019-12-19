package com.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** 拦截器:直接或间接实现HandlerInterceptor或者WebRequestInterceptor
 * 控制器执行的基本流程:
 * 1.控制器方法执行
 * 2.视图解析
 * 3.视图呈现(render)
 * @author cj
 * @date 2019/11/20
 */
public class SecondInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {
    /**
     * preHandle是在控制器方法执行之前运行
     *
     * 返回false表示后续流程就不走了,类似于filter代码不调用chain.doFilter
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        System.out.println("username"+username);
        if(username==null){
            response.sendRedirect("/adminLogin");
            return false;
        }
        return true;
    }

    /**
     * postHaandle是在控制器方法执行完成之后,但是在视图处理之前运行
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("2222post handle-----");
    }

    /**
     * 这个方法是在视图已经处理完毕之后再执行
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
        System.out.println("22222after compltion----");
    }
}
