package oa.controller;

import oa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    @ResponseBody
    public String login(String employeeName,String pwd){

        return employeeService.login();
    }
    @RequestMapping("/register")
    public String register(String employeeName,String password,String confirmPassword){

        return "index";
    }
}
