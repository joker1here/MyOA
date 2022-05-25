package oa.mapper;

import oa.pojo.Work;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface WorkMapper {
    @Select("SELECT * FROM work ORDER BY workTime DESC")
    List<Work> findAllWork();

    @Select("SELECT * FROM work WHERE WorkId = #{id}")
    Work findWorkById(int id);

    @Insert("insert into work VALUES" +
            "(#{workId},#{workTime},#{employeeId},#{workTo},#{workText},#{workFinish})")
    void saveWork(Work Work);

    @Update("update work set " +
            "workTime=#{workTime},employeeId=#{employeeId},workTo=#{workTo}" +
            ",workText=#{workText},workFinish=#{workFinish} where workId=#{workId}")
    void updateWork(Work work);

    @Delete("DELETE FROM work WHERE WorkId = #{id}")
    void deleteWorkById(int id);

    @Select("SELECT COUNT(1) FROM work WHERE workFinish<100 AND workTo=#{employeeId}")
    int CountWorkNoFinish(int employeeId);

    @Select("SELECT * FROM work WHERE workFinish=100 AND workTo=#{employeeId} ORDER BY workTime DESC")
    List<Work> ShowWorkFinish(int employeeId);
    @Select("SELECT * FROM work WHERE workFinish<100 AND workTo=#{employeeId} ORDER BY workTime DESC")
    List<Work> ShowWorkNoFinish(int employeeId);
    @Select("SELECT * FROM work WHERE  workTo=#{employeeId} ORDER BY workFinish ASC ,workTime DESC")
    List<Work> ShowWork(int employeeId);
}
