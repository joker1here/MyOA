package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Notice;
import oa.pojo.Work;
import oa.service.EmployeeService;
import oa.service.FileService;
import oa.service.NoticeService;
import oa.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
    public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session){
        System.out.println("名字"+employeeName+"密码"+password);
        ModelAndView modelAndView = new ModelAndView();
        Employee employee=employeeService.login(employeeName,password);
        if (employee!=null){
            session.setAttribute("employee",employee);
            //用户
            modelAndView.addObject("employee", employee);

            modelAndView.setViewName("/main.jsp");
        }
        else {
            modelAndView.addObject("WrongMessage", "登陆失败，请确认账号和密码！");
            modelAndView.setViewName("/login/login.jsp");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/register" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(@RequestParam("username") String employeeName, String password){
        return employeeService.register(employeeName,password);
    }
    @RequestMapping(value = "/getOnlineCount" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getOnlineCount(HttpServletRequest request){
        HttpSession session = request.getSession();
        ServletContext context = session.getServletContext();
        return context.getAttribute("lineCount").toString();
    }
}
