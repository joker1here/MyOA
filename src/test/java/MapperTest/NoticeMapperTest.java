package MapperTest;

import oa.mapper.NoticeMapper;
import oa.pojo.Notice;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class NoticeMapperTest {
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
        NoticeMapper mapper = session.getMapper(NoticeMapper.class);
        List<Notice> list = mapper.findAllNotice();
        for (Notice l : list) {
            System.out.println(l);
        }
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        NoticeMapper mapper = session.getMapper(NoticeMapper.class);
        Notice Notice = mapper.findNoticeById(1);
        System.out.println(Notice);
    }
    @Test
    public void save() throws IOException {
        SqlSession session = getSession();
        NoticeMapper mapper = session.getMapper(NoticeMapper.class);
        Notice Notice = new Notice();
        Notice.setNoticeInfo("这是测试用的通知");
        Notice.setNoticeName("测试通知");
        Notice.setEmployeeId(2);
        Notice.setNoticeTime(getDate());
        mapper.saveNotice(Notice);
        session.commit();

        findall();
    }
    @Test
    public void update() throws IOException {
        SqlSession session = getSession();
        NoticeMapper mapper = session.getMapper(NoticeMapper.class);
        Notice Notice = new Notice();
        Notice = mapper.findNoticeById(4);
        Notice.setNoticeInfo("这是修改成功后的的通知");
        mapper.updateNotice(Notice);
        session.commit();

        findall();
    }
    @Test
    public void delete() throws IOException {
        SqlSession session = getSession();
        NoticeMapper mapper = session.getMapper(NoticeMapper.class);

        mapper.deleteNoticeById(4);
        session.commit();

        findall();
    }

}
