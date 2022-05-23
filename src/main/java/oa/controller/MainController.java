// package oa.controller;
//
// import oa.pojo.Employee;
// import oa.pojo.Notice;
// import oa.pojo.Work;
// import oa.service.EmployeeService;
// import oa.service.FileService;
// import oa.service.NoticeService;
// import oa.service.WorkService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.servlet.ModelAndView;
//
// import javax.servlet.http.HttpSession;
// import java.util.List;
//
// @Controller
// @RequestMapping("/main")
// public class MainController {
//     @Autowired
//     private EmployeeService employeeService;
//     @Autowired
//     private FileService fileService;
//     @Autowired
//     private WorkService workService;
//     @Autowired
//     private NoticeService noticeService;
//     @RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
//     public ModelAndView login(@RequestParam("username") String employeeName, String password, HttpSession session){
//         System.out.println("名字"+employeeName+"密码"+password);
//         ModelAndView modelAndView = new ModelAndView();
//         Employee employee=employeeService.login(employeeName,password);
//         if (employee!=null){
//             session.setAttribute("employee",employee);
//             //用户
//             modelAndView.addObject("employee", employee);
//             //在线人数
//             modelAndView.addObject("lineCount", session.getServletContext().getAttribute("lineCount"));
//             //通知
//             List<Notice> allNotice = noticeService.findAllNotice();
//             modelAndView.addObject("noticeList",allNotice);
//             //未读邮件
//             int fileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
//             modelAndView.addObject("countFileNoRead", fileNoRead);
//             //未完成工作数量
//             int countWorkNoFinish = workService.CountWorkNoFinish(employee.getEmployeeId());
//             modelAndView.addObject("countWorkNoFinish", countWorkNoFinish);
//             //未完成工作
//             List<Work> showWorkNoFinish = workService.ShowWorkNoFinish(employee.getEmployeeId());
//             modelAndView.addObject("workNoFinishList", showWorkNoFinish);
//             //完成工作
//             List<Work> showWorkFinish = workService.ShowWorkFinish(employee.getEmployeeId());
//             modelAndView.addObject("workFinishList", showWorkFinish);
//
//             System.out.println(allNotice);
//             System.out.println(showWorkFinish);
//             System.out.println(showWorkNoFinish);
//
//             modelAndView.setViewName("/main.jsp");
//         }
//         else {
//             modelAndView.setViewName("/login/login.jsp");
//         }
//         return modelAndView;
//     }
// }
