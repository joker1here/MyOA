package oa.service;

import oa.mapper.AttendanceMapper;
import oa.mapper.EmployeeMapper;
import oa.pojo.Attendance;
import oa.pojo.Employee;
import oa.util.SqlSessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceService {
    private AttendanceMapper attendanceMapper = (AttendanceMapper) SqlSessionUtil.getSession(AttendanceMapper.class);
    @Autowired
    private EmployeeService employeeService;

    public List<Attendance> findAllAttendance() {
        List<Attendance> attendanceList = attendanceMapper.findAllAttendance();
        for (Attendance attendance : attendanceList) {
            if (attendance.getAttendanceEmployee()!=0){
                Employee employee = employeeService.findEmployeeById(attendance.getAttendanceEmployee());
                attendance.setEmployee(employee);
            }
        }
        return attendanceList;
    }
}
