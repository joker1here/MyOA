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

    public Employee login(String employeeName, String password) {
        Employee employee = employeeMapper.findEmployeeByNameAndPwd(employeeName, password);
        // System.out.println(employee);
        return DeptAndJob(employee);
    }

    public String register(String employeeName, String password) {
        Employee employee =new Employee();
        employee.setEmployeeName(employeeName);
        employee.setPwd(password);
        try {
            if (employeeMapper.findEmployeeByName(employeeName)!=null){
                return "已经存在该账户！";
            }
            employeeMapper.saveEmployee(employee);
            return "Success！";
        }catch (Exception e){
            System.out.println("注册异常："+e);
            return "数据库异常！";
        }
    }

    public Employee findEmployeeByName(String Name) {
        Employee employee= employeeMapper.findEmployeeByName(Name);
        return DeptAndJob(employee);
    }

    public Employee findEmployeeById(int attendanceEmployee) {
        Employee employee = employeeMapper.findEmployeeById(attendanceEmployee);
        return DeptAndJob(employee);
    }

    public void update(Employee employee) {
        employeeMapper.updateEmployee(employee);
    }

    public List<Employee> findAllEmployee() {
        List<Employee> employeeList = employeeMapper.findAllEmployee();
        for (Employee employee : employeeList) {
            employee = DeptAndJob(employee);
        }
        return employeeList;
    }

    public List<Employee> findEmployeeUnderLevel(int userLevel) {
        List<Employee> employeeList = employeeMapper.findEmployeeUnderLevel(userLevel);
        for (Employee employee : employeeList) {
            employee = DeptAndJob(employee);
        }
        return employeeList;
    }

    public void deleteEmployeeById(int employeeId) {
        employeeMapper.deleteEmployeeById(employeeId);
    }
}
