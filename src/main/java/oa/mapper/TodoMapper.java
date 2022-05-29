package oa.mapper;

import oa.pojo.Todo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface TodoMapper {
    @Select("SELECT * FROM todo")
    List<Todo> findAllTodo();

    @Select("SELECT * FROM todo WHERE TodoId = #{id}")
    Todo findTodoById(int id);

    @Insert("insert into todo VALUES" +
            "(#{TodoId},#{TodoText},#{TodoFinish},#{EmployeeId})")
    void saveTodo(Todo Todo);

    @Update("update todo set TodoText=#{TodoText},TodoFinish=#{TodoFinish},EmployeeId=#{EmployeeId} " +
            "where TodoId=#{TodoId}")
    void updateTodo(Todo Todo);

    @Delete("DELETE FROM todo WHERE TodoId = #{id}")
    void deleteTodoById(int id);

    @Select("SELECT * FROM todo WHERE EmployeeId = #{employeeId}")
    List<Todo> findTodoByEmployeeId(int employeeId);
}
