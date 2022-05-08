package oa.mapper;

import oa.pojo.Task;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TaskMapper {
    @Select("SELECT * FROM Task")
    List<Task> findAllTask();

    @Select("SELECT * FROM Task WHERE TaskId = #{id}")
    Task findTaskById(int id);

    @Insert("insert into Task VALUES" +
            "(#{taskId},#{taskInfo},#{taskName},#{employeeId},#{finishTime})")
    void saveTask(Task Task);

    @Update("update Task set taskInfo=#{taskInfo},taskName=#{taskName}," +
            "employeeId=#{employeeId},finishTime=#{finishTime} " +
            "where TaskId=#{taskId}")
    void updateTask(Task Task);

    @Delete("DELETE FROM Task WHERE TaskId = #{id}")
    void deleteTaskById(int id);
}
