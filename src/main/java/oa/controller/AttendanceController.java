package oa.controller;

import oa.pojo.Attendance;
import oa.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}
