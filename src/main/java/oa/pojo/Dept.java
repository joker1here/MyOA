package oa.pojo;

public class Dept {
    private int deptId;
    private String deptIntroduce;
    private String deptName;

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getDeptIntroduce() {
        return deptIntroduce;
    }

    public void setDeptIntroduce(String deptIntroduce) {
        this.deptIntroduce = deptIntroduce;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "deptId=" + deptId +
                ", deptIntroduce='" + deptIntroduce + '\'' +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}
