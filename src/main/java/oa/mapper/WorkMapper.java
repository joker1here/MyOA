package oa.mapper;

import oa.pojo.Work;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface WorkMapper {
    @Select("SELECT * FROM Work ORDER BY workTime DESC")
    List<Work> findAllWork();

    @Select("SELECT * FROM Work WHERE WorkId = #{id}")
    Work findWorkById(int id);

    @Insert("insert into Work VALUES" +
            "(#{workId},#{workTime},#{employeeId},#{workTo},#{workText},#{workFinish})")
    void saveWork(Work Work);

    @Update("update Work set " +
            "workTime=#{workTime},employeeId=#{employeeId},workTo=#{workTo}" +
            ",workText=#{workText},workFinish=#{workFinish} where workId=#{workId}")
    void updateWork(Work work);

    @Delete("DELETE FROM Work WHERE WorkId = #{id}")
    void deleteWorkById(int id);

    @Select("SELECT COUNT(1) FROM Work WHERE WorkRead=0 AND EmployeeID=#{employeeId}")
    int CountWorkNoFinish(int employeeId);

    @Select("SELECT * FROM Work WHERE workFinish=1 AND EmployeeID=#{employeeId} ORDER BY workTime DESC")
    List<Work> ShowWorkFinish(int employeeId);
    @Select("SELECT * FROM Work WHERE workFinish=0 AND EmployeeID=#{employeeId} ORDER BY workTime DESC")
    List<Work> ShowWorkNoFinish(int employeeId);
}
