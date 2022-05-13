package oa.pojo;

import java.util.Date;

public class File {
    private int fileId;
    private String fileName;
    private String fileForm;
    private Date fileTime;
    private String fileText;
    private String FileTo;
    private int employeeId;
    private int fileRead;

    public int getFileRead() {
        return fileRead;
    }

    public void setFileRead(int fileRead) {
        this.fileRead = fileRead;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFileForm() {
        return fileForm;
    }

    public void setFileForm(String fileForm) {
        this.fileForm = fileForm;
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileText() {
        return fileText;
    }

    public void setFileText(String fileText) {
        this.fileText = fileText;
    }

    public Date getFileTime() {
        return fileTime;
    }

    public void setFileTime(Date fileTime) {
        this.fileTime = fileTime;
    }

    public String getFileTo() {
        return FileTo;
    }

    public void setFileTo(String fileTo) {
        FileTo = fileTo;
    }

    @Override
    public String toString() {
        return "File{" +
                "fileId=" + fileId +
                ", fileName='" + fileName + '\'' +
                ", fileForm='" + fileForm + '\'' +
                ", fileTime=" + fileTime +
                ", fileText='" + fileText + '\'' +
                ", FileTo='" + FileTo + '\'' +
                ", employeeId=" + employeeId +
                ", fileRead=" + fileRead +
                '}';
    }
}
