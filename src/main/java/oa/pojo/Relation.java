package oa.pojo;

public class Relation {
    private int employeeId;
    private int deptId;
    private int jobId;

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "employeeId=" + employeeId +
                ", deptId=" + deptId +
                ", jobId=" + jobId +
                '}';
    }
}
