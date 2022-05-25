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
}
