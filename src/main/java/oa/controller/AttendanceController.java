package oa.controller;

import oa.pojo.Attendance;
import oa.pojo.Employee;
import oa.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;
    @RequestMapping("attendanceList")
    public ModelAndView attendanceList(){
        ModelAndView modelAndView = new ModelAndView();
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        System.out.println(attendanceList);
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }

    @RequestMapping("signUp")
    public ModelAndView signUp(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", "签到成功！");
        Employee employee= (Employee) session.getAttribute("employee");
        if (attendanceService.alreadySignUp(employee.getEmployeeId())){
            modelAndView.addObject("Message", "已经签到了，请签退！");
        }
        else {
            try {
                attendanceService.signUp(employee.getEmployeeId());
                //modelAndView.addObject("Message", "签到成功");
            }catch (Exception e){
                modelAndView.addObject("Message", "系统错误！");
            }
        }
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        //System.out.println(attendanceList);
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }
    @RequestMapping("signBack")
    public ModelAndView signBack(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", "签退成功！");
        Employee employee= (Employee) session.getAttribute("employee");
        if (!attendanceService.alreadySignUp(employee.getEmployeeId())){
            modelAndView.addObject("Message", "请先签到！");
        }
        else {
            try {
                attendanceService.signBack(employee.getEmployeeId());
                //modelAndView.addObject("Message", "签退成功");
            }catch (Exception e){
                modelAndView.addObject("Message", "系统错误！");
            }
        }
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        //System.out.println(attendanceList);
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }
}
