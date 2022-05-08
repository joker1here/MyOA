package oa.controller;

import oa.pojo.Employee;
import oa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    @ResponseBody
    public Employee login(@RequestParam("username1") String employeeName,@RequestParam("userpwd1") String password, HttpSession session){
        System.out.println("名字"+employeeName+"密码"+password);
        Employee employee=employeeService.login(employeeName,password);
        if (employee!=null)session.setAttribute("employee",employee);
        return employee;
    }

    @RequestMapping(value = "/register" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(@RequestParam("username2") String employeeName,@RequestParam("userpwd2") String password,@RequestParam("userpwd3") String confirmpassword){
        if (password.equals(confirmpassword))
        return employeeService.register(employeeName,password);
        else return "密码验证错误";
    }
}
