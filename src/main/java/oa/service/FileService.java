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

    public List<File> ShowFileRead(int employeeId) {
        return fileMapper.ShowFileRead(employeeId);
    }

    public List<File> ShowFileNoRead(int employeeId) {
        return fileMapper.ShowFileNoRead(employeeId);
    }
}
