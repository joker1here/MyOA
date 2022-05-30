package oa.mapper;

import oa.pojo.Job;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface JobMapper {
    @Select("SELECT * FROM job")
    List<Job> findAllJob();

    @Select("SELECT * FROM job WHERE JobId = #{id}")
    Job findJobById(int id);

    @Insert("insert into job VALUES " +
            "(#{jobId},#{jobIntroduce},#{jobName})")
    void saveJob(Job Job);

    @Update("update job set JobIntroduce=#{jobIntroduce},JobName=#{jobName} " +
            "where JobId=#{jobId}")
    void updateJob(Job Job);

    @Delete("DELETE FROM job WHERE JobId = #{id}")
    void deleteJobById(int id);

    @Select("SELECT * FROM job WHERE jobName = #{jobName}")
    Job findJobByJobName(String jobName);
}
