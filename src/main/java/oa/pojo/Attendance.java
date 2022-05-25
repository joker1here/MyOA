package oa.pojo;

import java.util.Date;

public class Attendance {
    private int AttendanceId;
    private int AttendanceEmployee;
    private Employee employee;
    private Date SignUpTime;
    private Date SignBackTime;
    private int min;

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getAttendanceId() {
        return AttendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        AttendanceId = attendanceId;
    }

    public int getAttendanceEmployee() {
        return AttendanceEmployee;
    }

    public void setAttendanceEmployee(int attendanceEmployee) {
        AttendanceEmployee = attendanceEmployee;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getSignUpTime() {
        return SignUpTime;
    }

    public void setSignUpTime(Date signUpTime) {
        SignUpTime = signUpTime;
    }

    public Date getSignBackTime() {
        return SignBackTime;
    }

    public void setSignBackTime(Date signBackTime) {
        SignBackTime = signBackTime;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "AttendanceId=" + AttendanceId +
                ", AttendanceEmployee=" + AttendanceEmployee +
                ", employee=" + employee +
                ", SignUpTime=" + SignUpTime +
                ", SignBackTime=" + SignBackTime +
                ", min=" + min +
                '}';
    }
}
