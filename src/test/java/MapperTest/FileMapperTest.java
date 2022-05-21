package MapperTest;

import oa.mapper.FileMapper;
import oa.pojo.File;
import org.apache.http.entity.ContentType;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class FileMapperTest {
    //抽取配置文件
    public static SqlSession getSession() throws IOException {
        //获得核心配置对象
        InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapConfig.xml");
        //获得session工厂对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        //获得session会话对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        return sqlSession;
    }

    @Test
    public void test() throws IOException {
        getSession();
    }
    @Test
    public void findall() throws IOException {
        SqlSession session = getSession();
        FileMapper mapper = session.getMapper(FileMapper.class);
        List<File> list = mapper.findAllFile();
        System.out.println(list);
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        FileMapper mapper = session.getMapper(FileMapper.class);
        File File = mapper.findFileById(1);
        System.out.println(File);
    }
    // //获取时间
    // public Date getDate(){
    //     Date date = new Date();
    //     date.setTime(System.currentTimeMillis());
    //     System.out.println(date);
    //     return date;
    // }
    // public java.io.File getFile(){
    //     java.io.File file =new java.io.File("C:\\Users\\32692\\Desktop\\路线.txt");
    //     System.out.println();
    //     return file;
    // }
    // //将文件存储到D:\Upload
    // @Test
    // public void test1() throws IOException {
    //     java.io.File file = getFile();
    //     FileInputStream fileInputStream = new FileInputStream(file);
    //     MultipartFile multipartFile = new MockMultipartFile("copy"+file.getName(),file.getName(), ContentType.APPLICATION_OCTET_STREAM.toString(),fileInputStream);
    //     String originalFilename = multipartFile.getOriginalFilename();
    //     multipartFile.transferTo(new java.io.File("D:\\Upload\\"+originalFilename));
    //     System.out.println(multipartFile.getName());
    // }
    // @Test
    // public void save() throws IOException {
    //     SqlSession session = getSession();
    //     FileMapper mapper = session.getMapper(FileMapper.class);
    //     File file = new File();
    //     file.setFileName("测试文件");
    //     file.setEmployeeId(1);
    //     file.setFileForm("txt");
    //     file.setFileTime(getDate());
    //     mapper.saveFile(file);
    //     session.commit();
    // }
    // @Test
    // public void update() throws IOException {
    //     SqlSession session = getSession();
    //     FileMapper mapper = session.getMapper(FileMapper.class);
    //     File File = new File();
    //     File.setFileId(5);
    //
    //     File.setFileName("测试部门");
    //     mapper.updateFile(File);
    //     session.commit();
    // }
    // @Test
    // public void delete() throws IOException {
    //     SqlSession session = getSession();
    //     FileMapper mapper = session.getMapper(FileMapper.class);
    //
    //     mapper.deleteFileById(5);
    //     session.commit();
    // }

}
