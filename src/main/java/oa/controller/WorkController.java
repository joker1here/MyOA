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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        List<Work> workListTo = workService.ShowWorkTo(employee.getEmployeeId());
        List<Employee> employeeList = employeeService.findEmployeeUnderLevel(employee.getUserLevel());
        modelAndView.addObject("workList", workList);
        modelAndView.addObject("workListTo", workListTo);
        modelAndView.addObject("employee", employee);
        modelAndView.addObject("Message", Message);
        modelAndView.addObject("employeeList", employeeList);
        System.out.println(Message);
        modelAndView.setViewName("/workItems/workItems.jsp");
        return modelAndView;
    }
    @RequestMapping("/updateFinish")
    public ModelAndView updateFinish(HttpSession session, @RequestParam(required = false) float finish, int workId){
        Work work = workService.findWorkById(workId);
        work.setWorkFinish(finish);
        String Message= workService.updateWork(work);
        return new ModelAndView("redirect:/work/ShowWork", "Message", Message);
    }

    @RequestMapping("add")
    public ModelAndView add(HttpSession session,String workText,String workFinish,String workDate,String workTo) throws ParseException {
        String Message = "Success!";
        Work work = new Work();
        Employee employee = (Employee) session.getAttribute("employee");
        try {
            work.setWorkFinish(Integer.parseInt(workFinish));
            work.setWorkText(workText);
            work.setWorkTo(Integer.parseInt(workTo));
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = simpleDateFormat.parse(workDate);
            work.setWorkTime(date);
            work.setEmployeeId(employee.getEmployeeId());
        }catch (Exception e){
            Message = "数据格式错误!";
            return new ModelAndView("redirect:/work/ShowWork", "Message", Message);
        }

        Message= workService.addWork(work);
        return new ModelAndView("redirect:/work/ShowWork", "Message", Message);
    }

    @RequestMapping("delete")
    public ModelAndView delete(String workId){
        String Message = workService.deleteWork(Integer.parseInt(workId));
        return new ModelAndView("redirect:/work/ShowWork", "Message", Message);
    }
}
