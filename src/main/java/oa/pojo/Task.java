package oa.pojo;

import java.util.Date;

public class Task {
    private int taskId;
    private String taskInfo;
    private String taskName;
    private int employeeId;
    private Date finishTime;

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTaskInfo() {
        return taskInfo;
    }

    public void setTaskInfo(String taskInfo) {
        this.taskInfo = taskInfo;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId=" + taskId +
                ", taskInfo='" + taskInfo + '\'' +
                ", taskName='" + taskName + '\'' +
                ", employeeId=" + employeeId +
                ", finishTime=" + finishTime +
                '}';
    }
}
