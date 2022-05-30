package oa.service;

import oa.mapper.DeptMapper;
import oa.pojo.Dept;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {
    private DeptMapper deptMapper = (DeptMapper) SqlSessionUtil.getSession(DeptMapper.class);

    public Dept findDeptByDeptName(String deptName) {
        return deptMapper.findDeptByDeptName(deptName);
    }

    public List<Dept> findAllDept() {
        return deptMapper.findAllDept();
    }
}
