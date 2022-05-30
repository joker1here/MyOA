package oa.mapper;

import oa.pojo.Employee;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface EmployeeMapper {
    @Select("select * from employee ORDER BY userLevel DESC")
    List<Employee> findAllEmployee();

    @Select("SELECT * FROM employee WHERE EmployeeId = #{id}")
    Employee findEmployeeById(int id);

    @Insert("insert into employee VALUES" +
            "(#{employeeId},#{employeeName},#{pwd},#{address},#{birthday},#{email}," +
            "#{mobile},#{photo},#{sex},#{userLevel},#{deptId},#{jobId})")
    void saveEmployee(Employee Employee);

    @Update("update employee set " +
            "employeeName=#{employeeName},pwd=#{pwd},address=#{address},birthday=#{birthday}" +
            ",email=#{email},mobile=#{mobile},photo=#{photo},sex=#{sex},userLevel=#{userLevel},deptId=#{deptId},jobId=#{jobId} " +
            "where employeeId=#{employeeId}")
    void updateEmployee(Employee Employee);

    @Delete("DELETE FROM employee WHERE employeeId = #{id}")
    void deleteEmployeeById(int id);

    @Select("SELECT * FROM employee where EmployeeName=#{employeeName} AND Pwd=#{pwd}")
    Employee findEmployeeByNameAndPwd(@Param("employeeName") String employeeName, @Param("pwd") String pwd);
    @Select("SELECT * FROM employee where EmployeeName=#{Name}")
    Employee findEmployeeByName(@Param("Name") String Name);

    @Select("select * from employee where userLevel< #{userLevel} ORDER BY userLevel DESC")
    List<Employee> findEmployeeUnderLevel(int userLevel);
}
