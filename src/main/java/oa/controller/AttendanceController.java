package oa.controller;

import oa.pojo.Attendance;
import oa.pojo.Employee;
import oa.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;
    @RequestMapping("attendanceList")
    public ModelAndView attendanceList(@RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        System.out.println(attendanceList);
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }

    @RequestMapping("signUp")
    public ModelAndView signUp(HttpSession session){
        String Message="Successful Sign In!";
        Employee employee= (Employee) session.getAttribute("employee");
        if (attendanceService.alreadySignUp(employee.getEmployeeId())){
            Message= "Already Signed In!";
        }
        else {
            try {
                attendanceService.signUp(employee.getEmployeeId());
            }catch (Exception e){
                Message= "DataBase Wrong!";
            }
        }
        return new ModelAndView("redirect:/attendance/attendanceList?Message="+Message);
    }
    @RequestMapping("signBack")
    public ModelAndView signBack(HttpSession session){
        String Message="Successful Sign Back!";
        Employee employee= (Employee) session.getAttribute("employee");
        if (!attendanceService.alreadySignUp(employee.getEmployeeId())){
           Message="Please Signed In！";
        }
        else {
            try {
                attendanceService.signBack(employee.getEmployeeId());
            }catch (Exception e){
                Message="DataBase Wrong!";
            }
        }
        return new ModelAndView("redirect:/attendance/attendanceList?Message="+Message);
    }
}
