package oa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @RequestMapping("/login")
    public String login(String employeeName,String pwd){

        return "index";
    }
    @RequestMapping("/register")
    public String register(String employeeName,String password,String confirmPassword){

        return "index";
    }
}
