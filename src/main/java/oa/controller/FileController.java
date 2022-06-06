package oa.controller;

import oa.pojo.Employee;
import oa.service.EmployeeService;
import oa.service.FileService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileController {
    @Autowired
    private FileService fileService;

    @Autowired
    private EmployeeService employeeService;

    //private String FilePath=request.getSession().getServletContext().getRealPath("/");

    //收件箱
    @RequestMapping("/main")
    public ModelAndView main(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        List<oa.pojo.File> fileList = fileService.findAllReceiveFileByEmployeeId(employee.getEmployeeId());
        modelAndView.addObject("fileList", fileList);

        modelAndView.setViewName("/email/email.jsp");
        return modelAndView;
    }
    //发件箱
    @RequestMapping("/fileListTo")
    public ModelAndView fileListTo(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        List<oa.pojo.File> fileList = fileService.findAllSentByEmployeeId(employee.getEmployeeId());
        modelAndView.addObject("fileList", fileList);
        modelAndView.setViewName("/email/email.jsp");
        return modelAndView;
    }
    //添加界面
    @RequestMapping("/compose")
    public ModelAndView compose(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        modelAndView.setViewName("/email/email_compose.jsp");
        return modelAndView;
    }
    //阅读界面
    @RequestMapping("/read")
    public ModelAndView read(HttpSession session,int fileId){
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        oa.pojo.File file = fileService.findFileById(fileId);
        file.setFileRead(1);
        //System.out.println(file);
        try{
            fileService.updateFile(file);
            System.out.println(file);
            System.out.println("更新成功");
        }catch (Exception e){
            System.out.println("错误");
            modelAndView.addObject("Message", "数据库错误");
        }

        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        modelAndView.addObject("file", file);
        modelAndView.setViewName("/email/email_read.jsp");
        return modelAndView;
    }
    //设为未读
    @RequestMapping("/noRead")
    public ModelAndView noRead(HttpSession session,String check){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", "操作成功");
        Employee employee = (Employee) session.getAttribute("employee");
        String[] list = check.split(",");
        System.out.println(list);
        for (String id : list) {
            System.out.println(id);
            oa.pojo.File file = fileService.findFileById(Integer.parseInt(id));
            System.out.println(id);
            file.setFileRead(0);
            System.out.println(file);
            try{
                fileService.updateFile(file);
                System.out.println(file);
                System.out.println("更新成功");
            }catch (Exception e){
                System.out.println("错误");
                modelAndView.addObject("Message", "数据库错误");
            }
        }
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        modelAndView.addObject("fileList", fileService.findAllReceiveFileByEmployeeId(employee.getEmployeeId()));
        modelAndView.setViewName("/email/email.jsp");
        return modelAndView;
    }
    //删除邮件
    @RequestMapping("/deleteEmail")
    public ModelAndView deleteEmail(HttpSession session,String check){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Message", "操作成功");
        Employee employee = (Employee) session.getAttribute("employee");
        String[] list = check.split(",");
        for (String id : list) {
            try{
                fileService.deleteFile(Integer.parseInt(id));
                System.out.println("删除成功");
            }catch (Exception e){
                System.out.println("错误");
                modelAndView.addObject("Message", "数据库错误");
            }
        }
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        modelAndView.addObject("fileList", fileService.findAllReceiveFileByEmployeeId(employee.getEmployeeId()));
        modelAndView.setViewName("/email/email.jsp");
        return modelAndView;
    }
    //发送
    @RequestMapping("/add")
    public ModelAndView add(HttpServletRequest request,HttpSession session,String fileToName,String fileText,String fileTitle,@RequestBody(required = false) MultipartFile file)  {
        ModelAndView modelAndView = new ModelAndView();
        Employee employee = (Employee) session.getAttribute("employee");
        int countFileNoRead = fileService.CountFileNoRead(employee.getEmployeeId());
        modelAndView.addObject("countFileNoRead", countFileNoRead);
        Employee ToEmployee = employeeService.findEmployeeByName(fileToName);
        oa.pojo.File newFile = new oa.pojo.File();
        if (ToEmployee==null){
            modelAndView.addObject("Message", "不存在该收件人!");
            System.out.println("不存在该收件人!");
            modelAndView.setViewName("/email/email_compose.jsp");
            return modelAndView;
        }
        System.out.println(file);
        if (!file.isEmpty()){
            try {
                //TODO保存路径
                String FilePath=request.getSession().getServletContext().getRealPath("/")+getDate()+"/";
                //创建文件夹
                creatPath(FilePath);
                //全名
                String originalFilename = file.getOriginalFilename();
                //后缀
                String type = file.getOriginalFilename().substring(originalFilename.lastIndexOf(".")+1);
                newFile.setFileForm(type);
                //文件名
                String name = file.getOriginalFilename().substring(0, originalFilename.length()-type.length()-1);
                newFile.setFileName(name);

                file.transferTo(new File(FilePath + originalFilename));
                //System.out.println("文件名：" + name+",后缀"+type);
            }catch (Exception e){
                modelAndView.addObject("Message", "上传文件失败!");
                modelAndView.setViewName("/email/email_compose.jsp");
                System.out.println("上传文件失败!");
                return modelAndView;
            }
        }
        //System.out.println("接收方："+fileTo+"，标题："+fileTitle+"，文本："+fileText);
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        newFile.setFileTime(date);
        newFile.setEmployeeId(employee.getEmployeeId());
        newFile.setEmployeeTo(employee);
        newFile.setFileText(fileText);
        newFile.setFileTitle(fileTitle);
        newFile.setFileTo(ToEmployee.getEmployeeId());
        newFile.setToEmployee(ToEmployee);
        String Message = fileService.saveFile(newFile);
        modelAndView.addObject("Message",Message);
        System.out.println(Message);
        modelAndView.setViewName("/email/email_compose.jsp");
        return modelAndView;
    }
    //
    public String getDate(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }
    //
    public void creatPath(String filePath){
        String s = filePath + "text.txt";
        File file = new File(s);
        if (!file.getParentFile().exists()) {
            System.out.println("Path not exists");
            //创建上级目录
            file.getParentFile().mkdirs();
        }
    }
    //下载
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response ,String fileId) throws IOException {
        oa.pojo.File downloadFile = fileService.findFileById(Integer.parseInt(fileId));
        String fileName = downloadFile.getFileName();
        String fileForm = downloadFile.getFileForm();
        request.setCharacterEncoding("UTF-8");
        String fileNAF = fileName + "." + fileForm;

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String FilePath=request.getSession().getServletContext().getRealPath("/")+simpleDateFormat.format(downloadFile.getFileTime())+"/";
        System.out.println(FilePath+fileNAF);
        try {
            File file = new File(FilePath + fileNAF);
            //创建输入流读文件
            FileInputStream in = new FileInputStream(file);
            //设置响应头ContentType指定响应内容的类型
            response.setHeader("Content-type", fileForm);
            //设置响应头Content-Disposition 指定以附件形式保存响应的信息
            response.setHeader("Content-Disposition", "attachment;filename=" + (URLEncoder.encode(fileNAF, "utf-8")));
            ServletOutputStream out = response.getOutputStream();
            //实现文件的读写
            IOUtils.copy(in, out);
            if (in != null) {
                in.close();
            }
        }catch (Exception e){

        }
    }
    @RequestMapping("/CountFileNoRead")
    @ResponseBody
    public int CountFileNoRead(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return fileService.CountFileNoRead(employee.getEmployeeId());
    }
    @RequestMapping("/ShowFileRead")
    @ResponseBody
    public List<oa.pojo.File> ShowFileRead(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return fileService.ShowReceiveFileRead(employee.getEmployeeId());
    }
    @RequestMapping("/ShowFileNoRead")
    @ResponseBody
    public List<oa.pojo.File> ShowFileNoRead(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return fileService.ShowReceiveFileNoRead(employee.getEmployeeId());
    }

    @RequestMapping("/test")
    public String test(){
        System.out.println("testing");
        return "/upload";
    }
    @RequestMapping("/test1")
    @ResponseBody
    public String test1(String s){
        System.out.println("testing"+s);
        return s;
    }
}
