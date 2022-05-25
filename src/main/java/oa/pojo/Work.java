package oa.pojo;

import java.util.Date;

public class Work {
    private int workId;
    private Date workTime;
    private int employeeId;
    private int workTo;
    private String workText;
    private float workFinish;

    public Date getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Date workTime) {
        this.workTime = workTime;
    }

    public int getWorkId() {
        return workId;
    }

    public void setWorkId(int workId) {
        this.workId = workId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getWorkTo() {
        return workTo;
    }

    public void setWorkTo(int workTo) {
        this.workTo = workTo;
    }

    public String getWorkText() {
        return workText;
    }

    public void setWorkText(String workText) {
        this.workText = workText;
    }

    public float getWorkFinish() {
        return workFinish;
    }

    public void setWorkFinish(float workFinish) {
        this.workFinish = workFinish;
    }

    @Override
    public String toString() {
        return "Work{" +
                "workId=" + workId +
                ", workTime=" + workTime +
                ", employeeId=" + employeeId +
                ", workTo=" + workTo +
                ", workText='" + workText + '\'' +
                ", workFinish=" + workFinish +
                '}';
    }
}
