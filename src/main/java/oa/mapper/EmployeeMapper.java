package oa.mapper;

import oa.pojo.Employee;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface EmployeeMapper {
    @Select("select * from Employee")
    List<Employee> findAllEmployee();

    @Select("SELECT * FROM Employee WHERE EmployeeId = #{id}")
    Employee findEmployeeById(int id);

    @Insert("insert into Employee VALUES" +
            "(#{employeeId},#{employeeName},#{pwd},#{address},#{birthday},#{email}," +
            "#{mobile},#{photo},#{sex},#{userLevel})")
    void saveEmployee(Employee Employee);

    @Update("update Employee set" +
            "address=#{address},birthday=#{birthday},email=#{email},employeeName=#{employeeName}" +
            ",mobile=#{mobile},photo=#{photo},pwd=#{pwd},sex=#{sex},userLevel=#{userLevel}" +
            "where employeeId=#{employeeId}")
    void updateEmployee(Employee Employee);

    @Delete("DELETE FROM Employee WHERE employeeId = #{id}")
    void deleteEmployeeById(int id);

    @Select("SELECT * FROM employee where EmployeeName=#{employeeName} AND Pwd=#{pwd}")
    Employee findEmployeeByNameAndPwd(@Param("employeeName") String employeeName, @Param("pwd") String pwd);
    @Select("SELECT * FROM employee where EmployeeName=#{Name}")
    Employee findEmployeeByName(@Param("Name") String Name);
}
