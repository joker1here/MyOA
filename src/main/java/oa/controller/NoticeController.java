package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Notice;
import oa.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    //跳转到通知界面
    @RequestMapping(value = "/noticeList")
    public ModelAndView noticeList(HttpSession session,@RequestParam(required = false)String Message){
        ModelAndView modelAndView=new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        List<Notice> noticeList=noticeService.findAllNotice();
        modelAndView.setViewName("/notice/notice.jsp");
        modelAndView.addObject("noticeList", noticeList);
        modelAndView.addObject("Message", Message);
        modelAndView.addObject("employee", employee);
        System.out.println(noticeList);
        return modelAndView;
    }
    //删除操作
    @RequestMapping("delete")
    public ModelAndView delete(String noticeId){
        String Message=noticeService.deleteNoticeById(Integer.parseInt(noticeId));
        return new ModelAndView("redirect:/notice/noticeList","Message",Message);
    }
    //添加操作
    @RequestMapping("add")
    public ModelAndView add(String title,String text,HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        Notice notice = new Notice();
        notice.setEmployeeId(employee.getEmployeeId());
        notice.setNoticeName(title);
        notice.setNoticeInfo(text);
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        notice.setNoticeTime(date);
        String Message=noticeService.addNotice(notice);
        return new ModelAndView("redirect:/notice/noticeList","Message",Message);
    }
}
