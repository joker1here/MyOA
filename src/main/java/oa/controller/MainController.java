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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/main")
public class MainController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private FileService fileService;
    @Autowired
    private WorkService workService;
    @Autowired
    private NoticeService noticeService;
    @RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
    public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session){
        System.out.println("名字"+employeeName+"密码"+password);
        ModelAndView modelAndView = new ModelAndView();
        Employee employee=employeeService.login(employeeName,password);
        if (employee!=null){
            session.setAttribute("employee",employee);
            //用户
            modelAndView.addObject("employee", employee);
            //在线人数
            modelAndView.addObject("lineCount", session.getServletContext().getAttribute("lineCount"));
            //通知
            List<Notice> allNotice = noticeService.findAllNotice();
            modelAndView.addObject("noticeList",allNotice);
            //未读邮件
            int fileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
            modelAndView.addObject("countFileNoRead", fileNoRead);
            //未完成工作数量
            int countWorkNoFinish = workService.CountWorkNoFinish(employee.getEmployeeId());
            modelAndView.addObject("countWorkNoFinish", countWorkNoFinish);
            //未完成工作
            List<Work> showWorkNoFinish = workService.ShowWorkNoFinish(employee.getEmployeeId());
            modelAndView.addObject("workNoFinishList", showWorkNoFinish);
            //完成工作
            List<Work> showWorkFinish = workService.ShowWorkFinish(employee.getEmployeeId());
            modelAndView.addObject("workFinishList", showWorkFinish);

            System.out.println(allNotice);
            System.out.println(showWorkFinish);
            System.out.println(showWorkNoFinish);

            modelAndView.setViewName("/main.jsp");
        }
        else {
            modelAndView.setViewName("/login/login.jsp");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/attendance",produces = "text/html;charset=UTF-8")
    public ModelAndView attendance(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/email",produces = "text/html;charset=UTF-8")
    public ModelAndView email(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/email/email.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/file",produces = "text/html;charset=UTF-8")
    public ModelAndView file(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/file/file.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/notice",produces = "text/html;charset=UTF-8")
    public ModelAndView notice(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/notice/notice.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/schedule",produces = "text/html;charset=UTF-8")
    public ModelAndView schedule(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/schedule/schedule.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/workItems",produces = "text/html;charset=UTF-8")
    public ModelAndView workItems(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/workItems/workItems.jsp");
        return modelAndView;
    }
}
