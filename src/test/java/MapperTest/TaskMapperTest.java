package MapperTest;

import oa.mapper.TaskMapper;
import oa.pojo.Task;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class TaskMapperTest {
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

    //获取时间
    public Date getDate(){
        Date date = new Date();
        date.setTime(System.currentTimeMillis());
        System.out.println(date);
        return date;
    }
    @Test
    public void test() throws IOException {
        getSession();
    }
    @Test
    public void findall() throws IOException {
        SqlSession session = getSession();
        TaskMapper mapper = session.getMapper(TaskMapper.class);
        List<Task> list = mapper.findAllTask();
        for (Task l : list) {
            System.out.println(l);
        }
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        TaskMapper mapper = session.getMapper(TaskMapper.class);
        Task Task = mapper.findTaskById(1);
        System.out.println(Task);
    }
    @Test
    public void save() throws IOException {
        SqlSession session = getSession();
        TaskMapper mapper = session.getMapper(TaskMapper.class);
        Task Task = new Task();
        Task.setTaskInfo("这是测试用的任务");
        Task.setTaskName("测试任务");
        Task.setEmployeeId(2);
        Task.setFinishTime(getDate());
        mapper.saveTask(Task);
        session.commit();

        findall();
    }
    @Test
    public void update() throws IOException {
        SqlSession session = getSession();
        TaskMapper mapper = session.getMapper(TaskMapper.class);
        Task Task = new Task();
        Task = mapper.findTaskById(4);
        Task.setTaskInfo("这是修改成功后的的任务");
        mapper.updateTask(Task);
        session.commit();

        findall();
    }
    @Test
    public void delete() throws IOException {
        SqlSession session = getSession();
        TaskMapper mapper = session.getMapper(TaskMapper.class);

        mapper.deleteTaskById(4);
        session.commit();

        findall();
    }

}
