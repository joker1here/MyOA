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

    public Dept findDeptByDeptId(int deptId) {
        return deptMapper.findDeptById(deptId);
    }

    public String update(Dept dept) {
        if (dept.getDeptId()!=0) {
            try {
                deptMapper.updateDept(dept);
                return "操作成功!";
            } catch (Exception e) {
                return "数据库错误!";
            }
        }else {
            try{
                deptMapper.saveDept(dept);
                return "成功保存!";
            }catch (Exception e){
                return "数据库错误";
            }
        }
    }

    public String delete(int deptId) {
        try{
            deptMapper.deleteDeptById(deptId);
            return "成功删除!";
        }catch (Exception e){
            return "数据库错误!";
        }
    }
}
