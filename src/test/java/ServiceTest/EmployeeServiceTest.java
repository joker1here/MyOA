package ServiceTest;

import com.mysql.cj.Session;
import oa.pojo.Employee;
import oa.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.servlet.http.HttpSession;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class EmployeeServiceTest {
    @Autowired
    private EmployeeService employeeService;

    @Test
    public void testlogin(){
        System.out.println(employeeService);
        Employee login = employeeService.login("张三", "123");
        System.out.println(login);
    }
    @Test
    public void testregister(){
        System.out.println(employeeService.register("wenshaojie","wenshaojie"));
    }
}
