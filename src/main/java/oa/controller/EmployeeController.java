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
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
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
    @Autowired
    private FileService fileService;
    @Autowired
    private WorkService workService;

    @RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
    public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session){
        System.out.println("名字"+employeeName+"密码"+password);
        ModelAndView modelAndView = new ModelAndView();
        Employee employee=employeeService.login(employeeName,password);
        if (employee!=null){
            session.setAttribute("employee",employee);
            //用户
            modelAndView.addObject("employee", employee);
            //未读邮件数量
            int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
            modelAndView.addObject("countFileNoRead", countFileNoRead);
            int countWorkNoFinish = workService.CountWorkNoFinish(employee.getEmployeeId());
            modelAndView.addObject("countWorkNoFinish", countWorkNoFinish);
            modelAndView.setViewName("/main.jsp");
        }
        else {
            modelAndView.addObject("Message", "登陆失败，请确认账号和密码！");
            modelAndView.setViewName("/login/login.jsp");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/logout",produces = "text/html;charset=UTF-8")
    public ModelAndView logout(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        session.removeAttribute("employee");
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/manage",produces = "text/html;charset=UTF-8")
    public ModelAndView manage(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.addObject("employee", employee);
        //先判断权限
        if (employee.getUserLevel()==0){
            modelAndView.addObject("Message","权限不足！");
            modelAndView.setViewName("/index/index.jsp");
            return modelAndView;
        }

        List<Employee> employeeList=employeeService.findAllEmployee();
        modelAndView.addObject("employeeList", employeeList);
        modelAndView.setViewName("/manage/manage.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/photo",produces = "text/html;charset=UTF-8")
    public ModelAndView photo(HttpSession session,@RequestBody(required = false) MultipartFile file) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", "更新成功");
        Employee employee = (Employee) session.getAttribute("employee");
        if (!file.isEmpty()){
            employee.setPhoto(file.getInputStream());
            try {
                employeeService.update(employee);
            }catch (Exception e){
                modelAndView.addObject("Message", "数据库更新失败");
            }
        }

        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/register" ,produces = "text/html;charset=UTF-8")
    public ModelAndView register(@RequestParam("username") String employeeName, String password){
        ModelAndView modelAndView = new ModelAndView();
        String s = employeeService.register(employeeName, password);
        modelAndView.addObject("Message", s);
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "/getOnlineCount" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getOnlineCount(HttpServletRequest request){
        HttpSession session = request.getSession();
        ServletContext context = session.getServletContext();
        return context.getAttribute("lineCount").toString();
    }
}
