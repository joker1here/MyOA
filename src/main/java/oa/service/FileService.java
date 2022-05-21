package oa.service;

import oa.mapper.FileMapper;
import oa.pojo.File;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileService {

    private FileMapper fileMapper = (FileMapper) SqlSessionUtil.getSession(FileMapper.class);

    public int CountFileNoRead(int empolyeeId) {
        return fileMapper.CountFileNoRead(empolyeeId);
    }

    public List<File> ShowReceiveFileRead(int employeeId) {
        return fileMapper.ShowReceiveFileRead(employeeId);
    }

    public List<File> ShowReceiveFileNoRead(int employeeId) {
        return fileMapper.ShowReceiveFileNoRead(employeeId);
    }

    public List<File> findAllFileById(int employeeId) {
        return fileMapper.findAllReceiveFileByEmployeeId(employeeId);
    }
}
