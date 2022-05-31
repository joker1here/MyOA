package oa.controller;

import oa.pojo.*;
import oa.service.*;
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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private JobService jobService;

    //转到登陆界面 TODO 有bug
    @RequestMapping("toLogin")
    public ModelAndView toLogin(@RequestParam(required = false)String Message) throws UnsupportedEncodingException {
        if (Message!=null) URLDecoder.decode(Message, "UTF-8");
        System.out.println("Login:"+Message);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }
    //转到主界面
    @RequestMapping("toMain")
    public ModelAndView toMain(@RequestParam(required = false)String Message,HttpSession session) throws UnsupportedEncodingException {
        if (Message!=null) URLDecoder.decode(Message, "UTF-8");
        System.out.println("Main:"+Message);
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.addObject("Message", Message);
        modelAndView.addObject("employee", employee);
        System.out.println(Message);
        modelAndView.setViewName("/main.jsp");
        return modelAndView;
    }
    //登陆
    @RequestMapping(value = "/login")
    public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session){
        System.out.println("名字"+employeeName+"密码"+password);
        Employee employee=employeeService.login(employeeName,password);
        if (employee!=null){
            session.setAttribute("employee",employee);
            return new ModelAndView("redirect:/employee/toMain");
        }
        else {
            String Message= "请确认用户名和密码！";
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("Message", Message);
            modelAndView.setViewName("/login/login.jsp");
            return modelAndView;
        }
    }
    //登出
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session){
        session.removeAttribute("employee");
        return new ModelAndView("redirect:/employee/toLogin");
    }
    //注册
    @RequestMapping(value = "/register")
    public ModelAndView register(@RequestParam("username") String employeeName, String password){
        String s = employeeService.register(employeeName, password);
        System.out.println(s);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", s);
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }
    //管理页面
    @RequestMapping(value = "/manage")
    public ModelAndView manage(HttpSession session,@RequestParam(required = false)String Message){
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
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/manage/manage.jsp");
        return modelAndView;
    }
    //个人中心
    @RequestMapping(value = "/profile")
    public ModelAndView profile(HttpSession session,@RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.setViewName("/profile/profileChange.jsp");
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        return modelAndView;
    }
    //管理个人界面
    @RequestMapping(value = "/change")
    public ModelAndView change(HttpSession session,String employeeId,@RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = employeeService.findEmployeeById(Integer.parseInt(employeeId));
        //TODO可添加下拉选项
        // List<Dept> deptList=deptService.findAllDept();
        // List<Job> jobList = jobService.findAllJob();
        // modelAndView.addObject("deptList", deptList);
        // modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/manage/profileChange.jsp");
        return modelAndView;
    }
    @RequestMapping("update")
    public ModelAndView update(HttpSession session,String EmployeeID,String username,
                               String password,String address,String Birthday,String email,
                               String sex,String userLevel,String DeptId,String JobId) throws ParseException {
        String Message = "Success!";
        Employee employee = new Employee();
        employee.setEmployeeId(Integer.parseInt(EmployeeID));
        employee.setEmployeeName(username);
        employee.setPwd(password);
        employee.setAddress(address);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(Birthday);
        employee.setBirthday(date);
        employee.setEmail(email);
        employee.setSex(Integer.parseInt(sex));
        employee.setUserLevel(Integer.parseInt(userLevel));
        Dept dept=deptService.findDeptByDeptName(DeptId);
        if (dept==null) Message = "DeptName Wrong!";
        else {
            employee.setDeptId(dept.getDeptId());
            employee.setDept(dept);
            Job job = jobService.findJobByJobName(JobId);
            if (job==null) Message = "JobName Wrong!";
            else {
                employee.setJobId(job.getJobId());
                employee.setJob(job);
                //更新操作
                try {
                    employeeService.update(employee);
                }catch (Exception e){
                    Message = "DataBase Wrong!";
                }
            }
        }

        //如果是当前用户则更新当前用户数据
        Employee employeeOnline = (Employee) session.getAttribute("employee");
        if (employeeOnline.getEmployeeId()==employee.getEmployeeId()){
            session.setAttribute("employee",employee);
            return new ModelAndView("redirect:/employee/profile?Message="+Message);
        }
        return new ModelAndView("redirect:/employee/change?employeeId="+employee.getEmployeeId()+"&Message="+Message);
    }

    @RequestMapping("delete")
    public ModelAndView delete(String employeeId){
        String Message = "Success!";
        try {
            employeeService.deleteEmployeeById(Integer.parseInt(employeeId));
        }catch (Exception e){
            Message = "Wrong!";
        }
        return new ModelAndView("redirect:/employee/manage?Message="+Message);
    }





    //TODO 其他

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

    @RequestMapping(value = "/getOnlineCount" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getOnlineCount(HttpServletRequest request){
        HttpSession session = request.getSession();
        ServletContext context = session.getServletContext();
        return context.getAttribute("lineCount").toString();
    }
}
