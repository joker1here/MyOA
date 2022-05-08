package oa.pojo;

import java.util.Date;

public class Notice {
    private int noticeId;
    private String noticeName;
    private String noticeInfo;
    private Date noticeTime;
    private int employeeId;

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }

    public String getNoticeInfo() {
        return noticeInfo;
    }

    public void setNoticeInfo(String noticeInfo) {
        this.noticeInfo = noticeInfo;
    }

    public Date getNoticeTime() {
        return noticeTime;
    }

    public void setNoticeTime(Date noticeTime) {
        this.noticeTime = noticeTime;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeId=" + noticeId +
                ", noticeName='" + noticeName + '\'' +
                ", noticeInfo='" + noticeInfo + '\'' +
                ", noticeTime=" + noticeTime +
                ", employeeId=" + employeeId +
                '}';
    }
}
