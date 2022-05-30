package MapperTest;

import oa.mapper.EmployeeMapper;
import oa.pojo.Employee;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class EmployeeMapperTest {
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
    public void findall() throws IOException {
        SqlSession session = getSession();
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        List<Employee> list = mapper.findAllEmployee();
        System.out.println(list);
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        Employee Employee = mapper.findEmployeeById(1);
        System.out.println(Employee);
    }


    // @Test
    // public void save() throws IOException {
    //     SqlSession session = getSession();
    //     EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
    //     Employee Employee = new Employee();
    //     Employee.setEmployeeName("王五");
    //     Employee.setAddress("肇庆学院");
    //     Date date=new Date();
    //     date.setTime(System.currentTimeMillis());
    //     System.out.println(date);
    //     Employee.setBirthday(date);
    //     Employee.setEmail("123@123.com");
    //     Employee.setPhoto("null");
    //     Employee.setMobile("123456789");
    //     Employee.setSex(1);
    //     Employee.setPwd("123");
    //     mapper.saveEmployee(Employee);
    //     session.commit();
    // }
    // @Test
    // public void update() throws IOException {
    //     SqlSession session = getSession();
    //     EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
    //     Employee Employee = new Employee();
    //     Employee.setEmployeeId(4);
    //     Employee.setEmployeeName("李六");
    //     mapper.updateEmployee(Employee);
    //     session.commit();
    // }
    // @Test
    // public void delete() throws IOException {
    //     SqlSession session = getSession();
    //     EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
    //
    //     mapper.deleteEmployeeById(4);
    //     session.commit();
    // }

}
