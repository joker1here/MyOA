package oa.interceptors;

import oa.pojo.Employee;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;


public class MyHandlerInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	/*
	 * 自定义拦截器 判断session是否存在用户 不存在就拦截返回登陆页面
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		//TODO 添加身份验证，没有实现

		// ServletContext context=session.getServletContext();
		// //用set集合来存储session对象
		// HashSet<HttpSession> sessionSet=(HashSet<HttpSession>) context.getAttribute("employee");
		// if(sessionSet==null){
		// 	sessionSet=new HashSet<HttpSession>();
		// 	context.setAttribute("employee", sessionSet);
		// }

		Employee employee = (Employee) session.getAttribute("employee");
		if (employee==null) {
			response.sendRedirect("/newViews/login/login.jsp");
			System.out.println("##");
			return false;
		}
		return true;

	}

}
