package oa.service;

import oa.mapper.DeptMapper;
import oa.mapper.EmployeeMapper;
import oa.mapper.JobMapper;
import oa.pojo.Employee;
import oa.pojo.Job;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;


@Service
public class EmployeeService {
    private EmployeeMapper employeeMapper= (EmployeeMapper) SqlSessionUtil.getSession(EmployeeMapper.class);
    private DeptMapper deptMapper= (DeptMapper) SqlSessionUtil.getSession(DeptMapper.class);
    private JobMapper jobMapper= (JobMapper) SqlSessionUtil.getSession(JobMapper.class);


    public static void main(String[] args) {
        System.out.println(new EmployeeService().employeeMapper.findAllEmployee());
    }

    public Employee login(String employeeName, String password) {
        Employee employee = employeeMapper.findEmployeeByNameAndPwd(employeeName, password);
        System.out.println(employee);
        if (employee!=null){
            if (employee.getDeptId()!=0) {
                employee.setDept(deptMapper.findDeptById(employee.getDeptId()));
            }
            if (employee.getJobId()!=0){
                employee.setJob(jobMapper.findJobById(employee.getJobId()));
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
            if (employeeMapper.findEmployeeByName(employeeName)!=null){
                return "已经有该用户！请重新注册！";
            }
            employeeMapper.saveEmployee(employee);
            return "注册成功";
        }catch (Exception e){
            System.out.println("注册异常："+e);
            return "操作异常，请刷新后操作";
        }
    }

    public Employee findEmployeeByName(String Name) {
        Employee employee= employeeMapper.findEmployeeByName(Name);
        if (employee.getDeptId()!=0) {
            employee.setDept(deptMapper.findDeptById(employee.getDeptId()));
        }
        if (employee.getJobId()!=0){
            employee.setJob(jobMapper.findJobById(employee.getJobId()));
        }
        return employee;
    }

    public Employee findEmployeeById(int attendanceEmployee) {
        Employee employee = employeeMapper.findEmployeeById(attendanceEmployee);
        if (employee.getDeptId()!=0) {
            employee.setDept(deptMapper.findDeptById(employee.getDeptId()));
        }
        if (employee.getJobId()!=0){
            employee.setJob(jobMapper.findJobById(employee.getJobId()));
        }
        return employee;
    }
}
