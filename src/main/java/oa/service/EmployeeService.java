package oa.service;

import oa.mapper.DeptMapper;
import oa.mapper.EmployeeMapper;
import oa.mapper.JobMapper;
import oa.pojo.Employee;
import oa.pojo.Job;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;


@Service
public class EmployeeService {
    private EmployeeMapper employeeMapper= (EmployeeMapper) SqlSessionUtil.getSession(EmployeeMapper.class);
    private DeptMapper deptMapper= (DeptMapper) SqlSessionUtil.getSession(DeptMapper.class);
    private JobMapper jobMapper= (JobMapper) SqlSessionUtil.getSession(JobMapper.class);

    //为员工添加部门和职位
    public Employee DeptAndJob(Employee employee){
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
    //登陆
    public Employee login(String employeeName, String password) {
        Employee employee = employeeMapper.findEmployeeByNameAndPwd(employeeName, password);
        // System.out.println(employee);
        return DeptAndJob(employee);
    }
    //注册
    public String register(String employeeName, String password) {
        Employee employee =new Employee();
        employee.setEmployeeName(employeeName);
        employee.setPwd(password);
        return save(employee);
    }
    //通过名字查找
    public Employee findEmployeeByName(String Name) {
        Employee employee= employeeMapper.findEmployeeByName(Name);
        return DeptAndJob(employee);
    }
    //通过ID查找
    public Employee findEmployeeById(int attendanceEmployee) {
        Employee employee = employeeMapper.findEmployeeById(attendanceEmployee);
        return DeptAndJob(employee);
    }
    //更新
    public void update(Employee employee) {
        employeeMapper.updateEmployee(employee);
    }
    //所有员工
    public List<Employee> findAllEmployee() {
        List<Employee> employeeList = employeeMapper.findAllEmployee();
        for (Employee employee : employeeList) {
            employee = DeptAndJob(employee);
        }
        return employeeList;
    }
    //找到所有比这个等级低的
    public List<Employee> findEmployeeUnderLevel(int userLevel) {
        List<Employee> employeeList = employeeMapper.findEmployeeUnderLevel(userLevel);
        for (Employee employee : employeeList) {
            employee = DeptAndJob(employee);
        }
        return employeeList;
    }
    //通过id删除
    public String deleteEmployeeById(int employeeId) {
        try {
            employeeMapper.deleteEmployeeById(employeeId);
        }catch (Exception e){
            return "数据库错误！";
        }
        return "成功!";
    }
    //添加新用户
    public String save(Employee employee) {
        String employeeName = employee.getEmployeeName();
        try {
            if (employeeMapper.findEmployeeByName(employeeName)!=null){
                return "已存在该用户!";
            }
            employeeMapper.saveEmployee(employee);
            return "成功！";
        }catch (Exception e){
            return "数据库错误!";
        }
    }
}
