package oa.controller;

import oa.pojo.Employee;
import oa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    @ResponseBody
    public Employee login(String employeeName, String password){
        System.out.println("名字"+employeeName+"密码"+password);
        return employeeService.login(employeeName,password);
    }
    @RequestMapping(value = "/register" ,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(String employeeName,String password){
        return employeeService.register(employeeName,password);
    }
}
