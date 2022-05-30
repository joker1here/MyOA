package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Work;
import oa.service.EmployeeService;
import oa.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    private WorkService workService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/ShowWork")
    public ModelAndView ShowWork(HttpSession session,@RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        List<Work> workList = workService.ShowWork(employee.getEmployeeId());
        List<Employee> employeeList = employeeService.findEmployeeUnderLevel(employee.getUserLevel());
        modelAndView.addObject("workList", workList);
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        modelAndView.addObject("employeeList", employeeList);
        System.out.println(Message);
        modelAndView.setViewName("/workItems/workItems.jsp");
        return modelAndView;
    }
    @RequestMapping("/updateFinish")
    public ModelAndView updateFinish(HttpSession session, @RequestParam(required = false) float finish, int workId){
        String Message= "Success!";
        Work work = workService.findWorkById(workId);
        work.setWorkFinish(finish);
        try{
            workService.updateWork(work);
        }catch (Exception e){
            Message="DataBase Option Wrong！";
        }
        return new ModelAndView("redirect:/work/ShowWork?Message="+Message);
    }









    //TODO 一些参数

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
    @RequestMapping("/CountWorkNoFinish")
    @ResponseBody
    public int CountWorkNoFinish(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return workService.CountWorkNoFinish(employee.getEmployeeId());
    }
}
