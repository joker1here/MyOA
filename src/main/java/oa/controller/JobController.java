package oa.controller;

import oa.pojo.Job;
import oa.pojo.Employee;
import oa.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/job")
public class JobController {
    @Autowired
    private JobService jobService;
    //管理页面
    @RequestMapping(value = "/manage")
    public ModelAndView manage(HttpSession session, @RequestParam(required = false)String Message){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        modelAndView.addObject("employee", employee);

        List<Job> jobList = jobService.findAllJob();
        modelAndView.addObject("jobList", jobList);
        modelAndView.addObject("Message", Message);
        modelAndView.setViewName("manage/jobManage.jsp");
        return modelAndView;
    }
    //修改界面
    @RequestMapping("change")
    public ModelAndView change(String Id){
        ModelAndView modelAndView = new ModelAndView();
        Job job = jobService.findJobByJobId(Integer.parseInt(Id));
        modelAndView.addObject("job", job);
        modelAndView.setViewName("manage/jobChange.jsp");
        return modelAndView;
    }
    //修改操作
    @RequestMapping("update")
    public ModelAndView update(String Id,String name,String Introduce){
        Job job = new Job();
        if (Id!=null&&!Id.equals(""))
            job = jobService.findJobByJobId(Integer.parseInt(Id));
        job.setJobName(name);
        job.setJobIntroduce(Introduce);
        String Message = jobService.update(job);
        return new ModelAndView("redirect:/job/manage", "Message", Message);
    }
    //删除操作
    @RequestMapping("delete")
    public ModelAndView delete(String Id){
        String Message = jobService.delete(Integer.parseInt(Id));
        return new ModelAndView("redirect:/job/manage", "Message", Message);
    }
    //跳转到添加页面
    @RequestMapping("add")
    public ModelAndView add(){
        return new ModelAndView("manage/jobAdd.jsp");
    }
}
