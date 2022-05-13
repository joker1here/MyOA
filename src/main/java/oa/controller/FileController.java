package oa.controller;

import oa.pojo.Employee;
import oa.service.FileService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileController {
    @Autowired
    private FileService fileService;

    private String FilePath="D:\\Upload\\";

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
    @RequestMapping("/upload")
    @ResponseBody
    public String save22(String username, MultipartFile uploadFile) throws IOException {
        System.out.println(username);
        System.out.println(uploadFile);

        //保存文件
        if (uploadFile!=null){
            String originalFilename = uploadFile.getOriginalFilename();
            uploadFile.transferTo(new File("D:\\Upload\\"+originalFilename));
            return "保存成功";
        }
        return "失败";
    }
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response ,@RequestBody(required = false) oa.pojo.File file1) throws IOException {
        file1=new oa.pojo.File();
        file1.setFileForm("txt");
        file1.setFileName("路线");

        request.setCharacterEncoding("UTF-8");
        String type = file1.getFileForm();
        String fileName=file1.getFileName()+"."+type;

        System.out.println(FilePath+fileName);
        File file = new File(FilePath+fileName);
        //创建输入流读文件
        FileInputStream in = new FileInputStream(file);
        //设置响应头ContentType指定响应内容的类型
        response.setHeader("Content-type",type);
        //设置响应头Content-Disposition 指定以附件形式保存响应的信息
        response.setHeader("Content-Disposition","attachment;filename="+(URLEncoder.encode(fileName, "utf-8")));
        ServletOutputStream out = response.getOutputStream();
        //实现文件的读写
        IOUtils.copy(in,out);
        if(in!=null){
            in.close();
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
        return fileService.ShowFileRead(employee.getEmployeeId());
    }
    @RequestMapping("/ShowFileNoRead")
    @ResponseBody
    public List<oa.pojo.File> ShowFileNoRead(HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        return fileService.ShowFileNoRead(employee.getEmployeeId());
    }

}
