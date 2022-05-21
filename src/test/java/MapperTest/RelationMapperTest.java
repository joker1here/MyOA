package MapperTest;

import oa.mapper.RelationMapper;
import oa.pojo.Relation;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class RelationMapperTest {
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
        RelationMapper mapper = session.getMapper(RelationMapper.class);
        List<Relation> list = mapper.findAllRelation();
        for (Relation l : list) {
            System.out.println(l);
        }
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        RelationMapper mapper = session.getMapper(RelationMapper.class);
        Relation Relation = mapper.findRelationById(1);
        System.out.println(Relation);
    }
    // @Test
    // public void save() throws IOException {
    //     SqlSession session = getSession();
    //     RelationMapper mapper = session.getMapper(RelationMapper.class);
    //     Relation Relation = new Relation();
    //     Relation.setEmployeeId(5);
    //     Relation.setDeptId(1);
    //     Relation.setJobId(1);
    //     mapper.saveRelation(Relation);
    //     session.commit();
    //
    //     findall();
    // }
    // @Test
    // public void update() throws IOException {
    //     SqlSession session = getSession();
    //     RelationMapper mapper = session.getMapper(RelationMapper.class);
    //     Relation Relation = new Relation();
    //     Relation = mapper.findRelationById(5);
    //     Relation.setJobId(2);
    //     mapper.updateRelation(Relation);
    //     session.commit();
    //
    //     findall();
    // }
    // @Test
    // public void delete() throws IOException {
    //     SqlSession session = getSession();
    //     RelationMapper mapper = session.getMapper(RelationMapper.class);
    //
    //     mapper.deleteRelationById(5);
    //     session.commit();
    //
    //     findall();
    // }

}
