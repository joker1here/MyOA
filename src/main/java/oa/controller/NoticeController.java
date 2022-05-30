package oa.controller;

import oa.pojo.Employee;
import oa.pojo.Notice;
import oa.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "/noticeList")
    public ModelAndView noticeList(HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/notice/notice.jsp");
        Employee employee = (Employee) session.getAttribute("employee");
        List<Notice> noticeList=noticeService.findAllNotice();
        modelAndView.addObject("noticeList", noticeList);
        modelAndView.addObject("employee", employee);
        System.out.println(noticeList);
        return modelAndView;
    }
    @RequestMapping("delete")
    public ModelAndView delete(String noticeId){
        noticeService.deleteNoticeById(Integer.parseInt(noticeId));
        return new ModelAndView("redirect:/notice/noticeList");
    }
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
        noticeService.addNotice(notice);
        return new ModelAndView("redirect:/notice/noticeList");
    }
}
