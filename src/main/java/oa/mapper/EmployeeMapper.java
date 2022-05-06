package oa.mapper;

import oa.pojo.Employee;

import java.util.List;

public interface EmployeeMapper {
    List<Employee> findAllEmployee();

    Employee findEmployeeById(int id);

    void saveEmployee(Employee Employee);

    void updateEmployee(Employee Employee);

    void deleteEmployeeById(int id);
}
