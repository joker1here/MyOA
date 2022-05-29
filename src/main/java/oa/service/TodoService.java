package oa.service;

import oa.mapper.TodoMapper;
import oa.pojo.Todo;
import oa.util.SqlSessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoService {
    private TodoMapper todoMapper = (TodoMapper) SqlSessionUtil.getSession(TodoMapper.class);

    @Autowired
    private EmployeeService employeeService;

    public Todo todoEmployee(Todo todo){
        if (todo.getEmployeeId()!=0)
            todo.setEmployee(employeeService.findEmployeeById(todo.getEmployeeId()));
        return todo;
    }

    public List<Todo> findTodoByEmployeeId(int employeeId) {
        List<Todo> todoList = todoMapper.findTodoByEmployeeId(employeeId);
        for (Todo todo : todoList) {
            todo = todoEmployee(todo);
        }
        return todoList;
    }

    public Todo findTodoById(int todoId) {
        return todoEmployee(todoMapper.findTodoById(todoId));
    }

    public void update(Todo todo) {
        todoMapper.updateTodo(todo);
    }

    public void addTodo(int employeeId, String text) {
        Todo todo = new Todo();
        todo.setEmployeeId(employeeId);
        todo.setTodoText(text);
        todoMapper.saveTodo(todo);
    }

    public void deleteTodoById(int todoId) {
        todoMapper.deleteTodoById(todoId);
    }
}
