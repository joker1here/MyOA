package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Todo;
import oa.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/todo")
public class TodoController {

    @Autowired
    private TodoService todoService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/index/index.jsp");
        Employee employee = (Employee) session.getAttribute("employee");
        List<Todo> todoList = todoService.findTodoByEmployeeId(employee.getEmployeeId());
        modelAndView.addObject("todoList", todoList);
        return modelAndView;
    }
    @RequestMapping(value = "/finish")
    public ModelAndView finish(String todoId){
        Todo todo =todoService.findTodoById(Integer.parseInt(todoId));
        todo.setTodoFinish(1);
        todoService.update(todo);
        return new ModelAndView("redirect:/todo/index");
    }
    @RequestMapping(value = "/unfinish")
    public ModelAndView unfinish(String todoId){
        Todo todo =todoService.findTodoById(Integer.parseInt(todoId));
        todo.setTodoFinish(0);
        todoService.update(todo);
        return new ModelAndView("redirect:/todo/index");
    }
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpSession session,String todoText){
        Employee employee = (Employee) session.getAttribute("employee");
        todoService.addTodo(employee.getEmployeeId(), todoText);
        return new ModelAndView("redirect:/todo/index");
    }
    @RequestMapping(value = "/delete")
    public ModelAndView delete(HttpSession session,String todoId){
        todoService.deleteTodoById(Integer.parseInt(todoId));
        return new ModelAndView("redirect:/todo/index");
    }
}
