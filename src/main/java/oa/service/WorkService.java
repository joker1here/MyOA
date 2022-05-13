package oa.service;

import oa.mapper.WorkMapper;
import oa.pojo.Work;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkService {
    private WorkMapper workMapper = (WorkMapper) SqlSessionUtil.getSession(WorkMapper.class);

    public List<Work> ShowWorkFinish(int employeeId) {
        return workMapper.ShowWorkFinish(employeeId);
    }

    public List<Work> ShowWorkNoFinish(int employeeId) {
        return workMapper.ShowWorkNoFinish(employeeId);
    }

    public int CountWorkNoFinish(int employeeId) {
        return workMapper.CountWorkNoFinish(employeeId);
    }
}
