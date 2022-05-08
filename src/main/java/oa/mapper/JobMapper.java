package oa.mapper;

import oa.pojo.Job;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface JobMapper {
    @Select("SELECT * FROM Job")
    List<Job> findAllJob();

    @Select("SELECT * FROM Job WHERE JobId = #{id}")
    Job findJobById(int id);

    @Insert("insert into Job VALUES " +
            "(#{jobId},#{jobIntroduce},#{jobName})")
    void saveJob(Job Job);

    @Update("update Job set JobIntroduce=#{jobIntroduce},JobName=#{jobName} " +
            "where JobId=#{jobId}")
    void updateJob(Job Job);

    @Delete("DELETE FROM Job WHERE JobId = #{id}")
    void deleteJobById(int id);
}
