package oa.controller;

import oa.pojo.Notice;
import oa.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "/noticeList" ,produces = "text/html;charset=UTF-8")
    public ModelAndView noticeList(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/Notice/Notice.jsp");
        List<Notice> noticeList=noticeService.findAllNotice();
        modelAndView.addObject("noticeList", noticeList);
        return modelAndView;
    }
}
