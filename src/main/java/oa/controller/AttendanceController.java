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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;
    //考勤列表
    @RequestMapping(value = "attendanceList")
    public ModelAndView attendanceList(@RequestParam(required = false)String Message) {
        //if (Message!=null) URLDecoder.decode(Message, "UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }
    //签到
    @RequestMapping("signUp")
    public ModelAndView signUp(HttpSession session) throws UnsupportedEncodingException {
        Employee employee= (Employee) session.getAttribute("employee");
        String Message=attendanceService.signUp(employee.getEmployeeId());
        return new ModelAndView("redirect:/attendance/attendanceList","Message",Message);
    }
    // 签退
    @RequestMapping("signBack")
    public ModelAndView signBack(HttpSession session) throws UnsupportedEncodingException {
        Employee employee= (Employee) session.getAttribute("employee");
        String Message = attendanceService.signBack(employee.getEmployeeId());
        return new ModelAndView("redirect:/attendance/attendanceList","Message",Message);
    }
}
