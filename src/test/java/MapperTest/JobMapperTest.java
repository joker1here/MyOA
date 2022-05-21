package MapperTest;

import oa.mapper.JobMapper;
import oa.pojo.Job;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class JobMapperTest {
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
        JobMapper mapper = session.getMapper(JobMapper.class);
        List<Job> list = mapper.findAllJob();
        for (Job job : list) {
            System.out.println(job);
        }
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        JobMapper mapper = session.getMapper(JobMapper.class);
        Job Job = mapper.findJobById(1);
        System.out.println(Job);
    }
    // @Test
    // public void save() throws IOException {
    //     SqlSession session = getSession();
    //     JobMapper mapper = session.getMapper(JobMapper.class);
    //     Job Job = new Job();
    //     Job.setJobIntroduce("这是测试用的工作职位");
    //     Job.setJobName("测试职位");
    //     mapper.saveJob(Job);
    //     session.commit();
    // }
    // @Test
    // public void update() throws IOException {
    //     SqlSession session = getSession();
    //     JobMapper mapper = session.getMapper(JobMapper.class);
    //     Job Job = new Job();
    //     Job.setJobId(5);
    //     Job.setJobIntroduce("这是修改成功后的的职位");
    //     Job.setJobName("测试职位");
    //     mapper.updateJob(Job);
    //     session.commit();
    // }
    // @Test
    // public void delete() throws IOException {
    //     SqlSession session = getSession();
    //     JobMapper mapper = session.getMapper(JobMapper.class);
    //
    //     mapper.deleteJobById(5);
    //     session.commit();
    // }

}
