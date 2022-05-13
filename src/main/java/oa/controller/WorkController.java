package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Work;
import oa.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    private WorkService workService;

    @RequestMapping("/ShowWorkFinish")
    @ResponseBody
    public List<Work> ShowWorkFinish(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return workService.ShowWorkFinish(employee.getEmployeeId());
    }
    @RequestMapping("/ShowWorkNoFinish")
    @ResponseBody
    public List<Work> ShowWorkNoFinish(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return workService.ShowWorkNoFinish(employee.getEmployeeId());
    }
}