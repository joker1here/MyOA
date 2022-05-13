package ServiceTest;

import oa.service.FileService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class FileServiceTest {
    @Autowired
    private FileService fileService;

    @Test
    public void test(){
        System.out.println(fileService.CountFileNoRead(1));
        System.out.println(fileService.ShowFileRead(1));
        System.out.println(fileService.ShowFileNoRead(1));
    }
}
