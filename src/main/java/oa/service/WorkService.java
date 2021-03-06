package oa.service;

import oa.mapper.EmployeeMapper;
import oa.mapper.WorkMapper;
import oa.pojo.Employee;
import oa.pojo.Work;
import oa.util.SqlSessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkService {
    private WorkMapper workMapper = (WorkMapper) SqlSessionUtil.getSession(WorkMapper.class);
    @Autowired
    private EmployeeService employeeService;

    public Work addEmployee(Work work){
        work.setEmployee(employeeService.findEmployeeById(work.getEmployeeId()));
        work.setWorkToEmployee(employeeService.findEmployeeById(work.getWorkTo()));
        return work;
    }

    public List<Work> ShowWorkFinish(int employeeId) {
        return workMapper.ShowWorkFinish(employeeId);
    }

    public List<Work> ShowWorkNoFinish(int employeeId) {
        return workMapper.ShowWorkNoFinish(employeeId);
    }

    public int CountWorkNoFinish(int employeeId) {
        return workMapper.CountWorkNoFinish(employeeId);
    }

    public List<Work> ShowWork(int employeeId) {
        List<Work> workList= workMapper.ShowWork(employeeId);
        for (Work work : workList) {
            work=addEmployee(work);
        }
        return workList;
    }

    public String updateWork(Work work) {
        try {
            workMapper.updateWork(work);
        }catch (Exception e){
            return "数据库错误";
        }
        return "操作成功";
    }

    public Work findWorkById(int workId) {
        return workMapper.findWorkById(workId);
    }

    public String addWork(Work work) {
        try {
            workMapper.saveWork(work);
        }catch (Exception e){
            return "数据库错误";
        }
        return "成功添加";
    }

    public List<Work> ShowWorkTo(int employeeId) {
        List<Work> workList = workMapper.ShowWorkTo(employeeId);
        for (Work work : workList) {
            work=addEmployee(work);
        }
        return workList;
    }

    public String deleteWork(int workId) {
        try {
            workMapper.deleteWorkById(workId);
        }catch (Exception e){
            return "数据库错误";
        }
        return "成功删除";
    }
}
