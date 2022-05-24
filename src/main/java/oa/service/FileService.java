package oa.service;

import oa.mapper.EmployeeMapper;
import oa.mapper.FileMapper;
import oa.pojo.Employee;
import oa.pojo.File;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileService {

    private FileMapper fileMapper = (FileMapper) SqlSessionUtil.getSession(FileMapper.class);
    private EmployeeMapper employeeMapper = (EmployeeMapper) SqlSessionUtil.getSession(EmployeeMapper.class);

    public List<File> AutoAddEmployee(List<File> fileList){
        for (File file : fileList) {
            file.setEmployeeTo(employeeMapper.findEmployeeById(file.getEmployeeId()));
            file.setToEmployee(employeeMapper.findEmployeeById(file.getFileTo()));
        }
        return fileList;
    }

    public int CountFileNoRead(int empolyeeId) {
        return fileMapper.CountFileNoRead(empolyeeId);
    }

    public List<File> ShowReceiveFileRead(int employeeId) {
        List<File> fileList = fileMapper.ShowReceiveFileRead(employeeId);
        return AutoAddEmployee(fileList);
    }

    public List<File> ShowReceiveFileNoRead(int employeeId) {
        List<File> fileList = fileMapper.ShowReceiveFileNoRead(employeeId);
        return AutoAddEmployee(fileList);
    }

    public List<File> findAllReceiveFileByEmployeeId(int employeeId) {
        List<File> fileList = fileMapper.findAllReceiveFileByEmployeeId(employeeId);
        return AutoAddEmployee(fileList);
    }

    public String saveFile(File file) {
        try{
            fileMapper.saveFile(file);
        }catch (Exception e){
            return "邮件发送失败！";
        }
        return "邮件发送成功";
    }

    public File findFileById(int fileId) {
        File file= fileMapper.findFileById(fileId);
        file.setEmployeeTo(employeeMapper.findEmployeeById(file.getEmployeeId()));
        file.setToEmployee(employeeMapper.findEmployeeById(file.getFileTo()));
        return file;
    }

    public List<File> findAllSentByEmployeeId(int employeeId) {
        List<File> fileList = fileMapper.findAllSentByEmployeeId(employeeId);
        return AutoAddEmployee(fileList);
    }
}
