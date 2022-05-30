package oa.mapper;

import oa.pojo.Dept;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface DeptMapper {
    @Select("SELECT * FROM dept")
    List<Dept> findAllDept();

    @Select("SELECT * FROM dept WHERE deptId = #{id}")
    Dept findDeptById(int id);

    @Insert("insert into dept VALUES" +
            "(#{deptId},#{deptIntroduce},#{deptName})")
    void saveDept(Dept dept);

    @Update("update dept set deptIntroduce=#{deptIntroduce},deptName=#{deptName} " +
            "where deptId=#{deptId}")
    void updateDept(Dept dept);

    @Delete("DELETE FROM dept WHERE deptId = #{id}")
    void deleteDeptById(int id);

    @Select("SELECT * FROM dept WHERE deptName = #{deptName}")
    Dept findDeptByDeptName(String deptName);
}
