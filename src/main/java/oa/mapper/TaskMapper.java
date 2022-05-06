package oa.mapper;

import oa.pojo.Task;

import java.util.List;

public interface TaskMapper {
    List<Task> findAllTask();

    Task findTaskById(int id);

    void saveTask(Task Task);

    void updateTask(Task Task);

    void deleteTaskById(int id);
}
