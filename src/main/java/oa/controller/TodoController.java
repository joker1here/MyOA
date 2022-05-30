package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Todo;
import oa.service.FileService;
import oa.service.NoticeService;
import oa.service.TodoService;
import oa.service.WorkService;
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
    @Autowired
    private WorkService workService;
    @Autowired
    private FileService fileService;
    @Autowired
    private NoticeService noticeService;
    //主页
    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/index/index.jsp");
        //todo列表
        modelAndView.addObject("todoList", todoService.findTodoByEmployeeId(employee.getEmployeeId()));
        //未完成任务数
        modelAndView.addObject("countNoFinishWork", workService.CountWorkNoFinish(employee.getEmployeeId()));
        //未读邮件数
        modelAndView.addObject("countNoReadFile", fileService.CountFileNoRead(employee.getEmployeeId()));
        //通知数
        modelAndView.addObject("countNotice", noticeService.countNotice());
        return modelAndView;
    }
    //完成
    @RequestMapping(value = "/finish")
    public ModelAndView finish(String todoId){
        Todo todo =todoService.findTodoById(Integer.parseInt(todoId));
        todo.setTodoFinish(1);
        todoService.update(todo);
        return new ModelAndView("redirect:/todo/index");
    }
    //没完成
    @RequestMapping(value = "/unfinish")
    public ModelAndView unfinish(String todoId){
        Todo todo =todoService.findTodoById(Integer.parseInt(todoId));
        todo.setTodoFinish(0);
        todoService.update(todo);
        return new ModelAndView("redirect:/todo/index");
    }
    //添加
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpSession session,String todoText){
        Employee employee = (Employee) session.getAttribute("employee");
        todoService.addTodo(employee.getEmployeeId(), todoText);
        return new ModelAndView("redirect:/todo/index");
    }
    //删除
    @RequestMapping(value = "/delete")
    public ModelAndView delete(HttpSession session,String todoId){
        todoService.deleteTodoById(Integer.parseInt(todoId));
        return new ModelAndView("redirect:/todo/index");
    }
}
