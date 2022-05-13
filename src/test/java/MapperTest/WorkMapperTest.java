package MapperTest;

import oa.mapper.WorkMapper;
import oa.pojo.Work;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class WorkMapperTest {
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
        WorkMapper mapper = session.getMapper(WorkMapper.class);
        List<Work> list = mapper.findAllWork();
        for (Work l : list) {
            System.out.println(l);
        }
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        WorkMapper mapper = session.getMapper(WorkMapper.class);
        Work Work = mapper.findWorkById(1);
        System.out.println(Work);
    }
    @Test
    public void save() throws IOException {
        SqlSession session = getSession();
        WorkMapper mapper = session.getMapper(WorkMapper.class);
        Work work = new Work();
        work.setEmployeeId(5);
        work.setWorkText("111");
        work.setWorkTime(getDate());
        work.setWorkTo(2);
        mapper.saveWork(work);
        session.commit();

        findall();
    }
    @Test
    public void update() throws IOException {
        SqlSession session = getSession();
        WorkMapper mapper = session.getMapper(WorkMapper.class);
        Work work = new Work();
        work = mapper.findWorkById(3);
        work.setWorkText("222");

        mapper.updateWork(work);
        session.commit();

        findall();
    }
    @Test
    public void delete() throws IOException {
        SqlSession session = getSession();
        WorkMapper mapper = session.getMapper(WorkMapper.class);

        mapper.deleteWorkById(4);
        session.commit();

        findall();
    }

}
