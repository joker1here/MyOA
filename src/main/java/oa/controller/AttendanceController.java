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
    @RequestMapping(value = "attendanceList")
    public ModelAndView attendanceList(@RequestParam(required = false)String Message) throws UnsupportedEncodingException {
        if (Message!=null) URLDecoder.decode(Message, "UTF-8");
        ModelAndView modelAndView = new ModelAndView();
        List<Attendance> attendanceList = attendanceService.findAllAttendance();
        // System.out.println(attendanceList);
        modelAndView.addObject("attendanceList", attendanceList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("/attendance/attendance.jsp");
        return modelAndView;
    }

    @RequestMapping("signUp")
    public ModelAndView signUp(HttpSession session) throws UnsupportedEncodingException {
        String Message="成功签到！";
        Employee employee= (Employee) session.getAttribute("employee");
        if (attendanceService.alreadySignUp(employee.getEmployeeId())){
            Message= "签到失败！已经签到了！";
        }
        else {
            try {
                attendanceService.signUp(employee.getEmployeeId());
            }catch (Exception e){
                Message= "数据库错误！";
            }
        }
        return new ModelAndView("redirect:/attendance/attendanceList?Message="+ URLEncoder.encode(Message,"UTF-8"));
    }
    @RequestMapping("signBack")
    public ModelAndView signBack(HttpSession session) throws UnsupportedEncodingException {
        String Message="成功签退！";
        Employee employee= (Employee) session.getAttribute("employee");
        if (!attendanceService.alreadySignUp(employee.getEmployeeId())){
           Message="请先签到！";
        }
        else {
            try {
                attendanceService.signBack(employee.getEmployeeId());
            }catch (Exception e){
                Message="数据库错误！";
            }
        }
        return new ModelAndView("redirect:/attendance/attendanceList?Message="+URLEncoder.encode(Message,"UTF-8"));
    }
}
