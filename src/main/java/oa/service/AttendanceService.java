package oa.service;

import oa.mapper.AttendanceMapper;
import oa.mapper.EmployeeMapper;
import oa.pojo.Attendance;
import oa.pojo.Employee;
import oa.util.SqlSessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class AttendanceService {
    private AttendanceMapper attendanceMapper = (AttendanceMapper) SqlSessionUtil.getSession(AttendanceMapper.class);
    @Autowired
    private EmployeeService employeeService;

    public List<Attendance> findAllAttendance() {
        List<Attendance> attendanceList = attendanceMapper.findAllAttendance();
        for (Attendance attendance : attendanceList) {
            attendance.setMin(minsBetween(attendance.getSignBackTime(),attendance.getSignUpTime()));
            if (attendance.getAttendanceEmployee()!=0){
                Employee employee = employeeService.findEmployeeById(attendance.getAttendanceEmployee());
                attendance.setEmployee(employee);
            }
        }
        return attendanceList;
    }
    public static int minsBetween(Date date1, Date date2) {
        Calendar cal = Calendar.getInstance();
        if (date1 == null || date2 == null) {
            return 0;
        }
        cal.setTime(date1);
        long time1 = cal.getTimeInMillis();
        cal.setTime(date2);
        long time2 = cal.getTimeInMillis();
        //算上当天
        return Math.abs(Integer.parseInt(String.valueOf((time2 - time1) / 60000L)) + 1);
    }

    public boolean alreadySignUp(int employeeId) {
        Attendance attendance=attendanceMapper.alreadySignUp(employeeId);
        return attendance != null;
        //不为空，表示已经签到
    }

    public void signUp(int employeeId) {
        Date date = getDate();
        Attendance attendance = new Attendance();
        attendance.setAttendanceEmployee(employeeId);
        attendance.setSignUpTime(date);
        attendanceMapper.saveAttendance(attendance);
    }

    public void signBack(int employeeId) {
        Date date = getDate();
        Attendance attendance=attendanceMapper.alreadySignUp(employeeId);
        attendance.setSignBackTime(date);
        attendanceMapper.updateAttendance(attendance);
    }
    //获取当前时间
    public Date getDate(){
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        System.out.println(date);
        return date;
    }
}
