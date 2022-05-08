package oa.service;

import com.sun.xml.internal.bind.v2.TODO;
import oa.mapper.DeptMapper;
import oa.mapper.EmployeeMapper;
import oa.mapper.JobMapper;
import oa.mapper.RelationMapper;
import oa.pojo.Employee;
import oa.pojo.Job;
import oa.pojo.Relation;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;


@Service
public class EmployeeService {
    private EmployeeMapper employeeMapper= (EmployeeMapper) SqlSessionUtil.getSession(EmployeeMapper.class);
    private DeptMapper deptMapper= (DeptMapper) SqlSessionUtil.getSession(DeptMapper.class);
    private JobMapper jobMapper= (JobMapper) SqlSessionUtil.getSession(JobMapper.class);
    private RelationMapper relationMapper= (RelationMapper) SqlSessionUtil.getSession(RelationMapper.class);

    public static void main(String[] args) {
        System.out.println(new EmployeeService().employeeMapper.findAllEmployee());
    }

    public Employee login(String employeeName, String password) {
        Employee employee = employeeMapper.findEmployeeByNameAndPwd(employeeName, password);
        System.out.println(employee);
        if (employee!=null){
            int id = employee.getEmployeeId();
            Relation relation = relationMapper.findRelationById(id);
            if (relation!=null) {
                employee.setDept(deptMapper.findDeptById(relation.getDeptId()));
                employee.setJob(jobMapper.findJobById(relation.getJobId()));
            }
            //TODO

            return employee;
        }
        return null;
    }

    public String register(String employeeName, String password) {
        Employee employee =new Employee();
        employee.setEmployeeName(employeeName);
        employee.setPwd(password);
        try {
            if (employeeMapper.findEmployeeByNameAndPwd(employeeName,password)!=null){
                return "已经有该用户！请重新注册！";
            }
            employeeMapper.saveEmployee(employee);
            return "保存成功";
        }catch (Exception e){
            System.out.println(e);
            return "操作异常，请刷新后操作";
        }
    }
}
