package oa.controller;

import oa.pojo.Dept;
import oa.pojo.Employee;
import oa.service.DeptService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;
    //管理页面
    @RequestMapping(value = "/manage")
    public ModelAndView manage(HttpSession session, @RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.addObject("employee", employee);

        List<Dept> deptList = deptService.findAllDept();
        modelAndView.addObject("deptList", deptList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("manage/deptManage.jsp");
        return modelAndView;
    }
    //修改界面
    @RequestMapping("change")
    public ModelAndView change(String Id){
        ModelAndView modelAndView = new ModelAndView();
        Dept dept = deptService.findDeptByDeptId(Integer.parseInt(Id));
        modelAndView.addObject("dept", dept);
        modelAndView.setViewName("manage/deptChange.jsp");
        return modelAndView;
    }
    //修改操作
    @RequestMapping("update")
    public ModelAndView update(String Id,String name,String Introduce){
        Dept dept = new Dept();
        if (Id!=null&&!Id.equals(""))
            dept = deptService.findDeptByDeptId(Integer.parseInt(Id));
        dept.setDeptName(name);
        dept.setDeptIntroduce(Introduce);
        String Message = deptService.update(dept);
        return new ModelAndView("redirect:/dept/manage","Message",Message);
    }
    //删除操作
    @RequestMapping("delete")
    public ModelAndView delete(String Id){
        String Message = deptService.delete(Integer.parseInt(Id));
        return new ModelAndView("redirect:/dept/manage","Message",Message);
    }
    //跳转到添加页面
    @RequestMapping("add")
    public ModelAndView add(){
        return new ModelAndView("manage/deptAdd.jsp");
    }
}
