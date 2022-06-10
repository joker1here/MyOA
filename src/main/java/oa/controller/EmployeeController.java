package oa.controller;

import oa.pojo.*;
import oa.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public ModelAndView toLogin(@RequestParam(required = false) String Message) throws UnsupportedEncodingException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }

    //转到主界面
    @RequestMapping("toMain")
    public ModelAndView toMain(@RequestParam(required = false) String Message, HttpSession session) throws UnsupportedEncodingException {
        if (Message != null) URLDecoder.decode(Message, "UTF-8");
        System.out.println("Main:" + Message);
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
    public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session) {
        System.out.println("名字" + employeeName + "密码" + password);
        Employee employee = employeeService.login(employeeName, password);
        if (employee != null) {
            session.setAttribute("employee", employee);
            return new ModelAndView("redirect:/employee/toMain");
        } else {
            String Message = "请确认用户名和密码！";
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("Message", Message);
            modelAndView.setViewName("/login/login.jsp");
            return modelAndView;
        }
    }

    //登出
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("employee");
        return new ModelAndView("redirect:/employee/toLogin");
    }

    //注册
    @RequestMapping(value = "/register")
    public ModelAndView register(@RequestParam("username") String employeeName, String password) {
        String s = employeeService.register(employeeName, password);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", s);
        modelAndView.setViewName("/login/login.jsp");
        return modelAndView;
    }

    //管理页面
    @RequestMapping(value = "/manage")
    public ModelAndView manage(HttpSession session, @RequestParam(required = false) String Message) {
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.addObject("employee", employee);

        List<Employee> employeeList = employeeService.findAllEmployee();
        modelAndView.addObject("employeeList", employeeList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("manage/employeeManage.jsp");
        return modelAndView;
    }

    //个人中心
    @RequestMapping(value = "/profile")
    public ModelAndView profile(HttpSession session, @RequestParam(required = false) String Message) {
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.setViewName("/profile/profileChange.jsp");
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        return modelAndView;
    }

    //管理个人界面
    @RequestMapping(value = "/change")
    public ModelAndView change(HttpSession session, String employeeId, @RequestParam(required = false) String Message) {
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = employeeService.findEmployeeById(Integer.parseInt(employeeId));
        //TODO可添加下拉选项
        List<Dept> deptList = deptService.findAllDept();
        List<Job> jobList = jobService.findAllJob();
        modelAndView.addObject("deptList", deptList);
        modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("manage/employeeChange.jsp");
        return modelAndView;
    }//添加员工界面

    @RequestMapping(value = "/addEmployee")
    public ModelAndView addEmployee(HttpSession session, @RequestParam(required = false) String Message) {
        ModelAndView modelAndView = new ModelAndView();
        //TODO可添加下拉选项
        List<Dept> deptList = deptService.findAllDept();
        List<Job> jobList = jobService.findAllJob();
        modelAndView.addObject("deptList", deptList);
        modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("manage/employeeAdd.jsp");
        return modelAndView;
    }

    //更新个人信息
    @RequestMapping("update")
    public ModelAndView update(HttpSession session, String EmployeeID, String username,
                               String password, String address, @RequestParam(required = false) String Birthday, String email,
                               String sex, String userLevel, String DeptId, String JobId) throws ParseException {
        String Message = "成功!";
        Employee employeeOnline = (Employee) session.getAttribute("employee");
        Employee employee = new Employee();
        //ID
        if (EmployeeID != null && !EmployeeID.equals(""))
            employee.setEmployeeId(Integer.parseInt(EmployeeID));
        //员工名称
        employee.setEmployeeName(username);
        //密码
        employee.setPwd(password);
        //地址
        employee.setAddress(address);
        if (Birthday != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date;
            try {
                date = simpleDateFormat.parse(Birthday);
            } catch (Exception e) {
                date = null;
            }
            employee.setBirthday(date);
        }
        //邮箱
        employee.setEmail(email);
        //性别
        System.out.println(sex);
        //if (sex!=null)
        employee.setSex(Integer.parseInt(sex));
        //等级
        if (userLevel != null && !userLevel.equals(""))
            employee.setUserLevel(Integer.parseInt(userLevel));
        //部门
        Dept dept = deptService.findDeptByDeptName(DeptId);
        if (DeptId != null && !DeptId.equals("") && dept == null) Message = "部门名出错!";
        else {
            if (DeptId != null && !DeptId.equals("")) {
                employee.setDeptId(dept.getDeptId());
                employee.setDept(dept);
            }
            //职位
            Job job = jobService.findJobByJobName(JobId);
            if (JobId != null && !JobId.equals("") && job == null) Message = "职位名出错!";
            else {
                if (JobId != null && !JobId.equals("")) {
                    employee.setJobId(job.getJobId());
                    employee.setJob(job);
                }
                //全部输入判断完毕
                //如果是本人操作
                if (employeeOnline.getEmployeeId() == employee.getEmployeeId()) {
                    //更新操作
                    try {
                        employeeService.update(employee);
                    } catch (Exception e) {
                        Message = "数据库错误!";
                    }
                    session.setAttribute("employee", employee);
                    return new ModelAndView("redirect:/employee/profile", "Message", Message);
                } else {//非本人
                    //如果目标用户等级过高
                    if (employeeOnline.getUserLevel() <= employee.getUserLevel()) {
                        Message = "你的等级不足！";
                        ModelAndView modelAndView = new ModelAndView();
                        modelAndView.setViewName("redirect:/employee/change");
                        modelAndView.addObject("employeeId", employee.getEmployeeId());
                        modelAndView.addObject("Message", Message);
                        return modelAndView;
                    } else {
                        //更新操作
                        if (employee.getEmployeeId() != 0) {
                            try {
                                employeeService.update(employee);
                            } catch (Exception e) {
                                Message = "数据库错误!";
                            }
                            ModelAndView modelAndView = new ModelAndView();
                            modelAndView.setViewName("redirect:/employee/change");
                            modelAndView.addObject("employeeId", employee.getEmployeeId());
                            modelAndView.addObject("Message", Message);
                            return modelAndView;
                        } else {
                            Message = employeeService.save(employee);
                            return new ModelAndView("redirect:/employee/manage", "Message", Message);
                        }
                    }
                }
            }
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/employee/change");
        modelAndView.addObject("employeeId", employee.getEmployeeId());
        modelAndView.addObject("Message", Message);
        return modelAndView;
    }

    //删除用户界面
    @RequestMapping("delete")
    public ModelAndView delete(String employeeId) {
        String Message = employeeService.deleteEmployeeById(Integer.parseInt(employeeId));
        return new ModelAndView("redirect:/employee/manage", "Message", Message);
    }
}





