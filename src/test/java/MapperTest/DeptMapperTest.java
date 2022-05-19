package MapperTest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import oa.mapper.DeptMapper;
import oa.pojo.Dept;
import oa.pojo.EasyUIResult;
import oa.util.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class DeptMapperTest {
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
        DeptMapper mapper = session.getMapper(DeptMapper.class);
        List<Dept> list = mapper.findAllDept();
        System.out.println(list);
    }
    @Test
    public void findbyid() throws IOException {
        SqlSession session = getSession();
        DeptMapper mapper = session.getMapper(DeptMapper.class);
        Dept dept = mapper.findDeptById(1);
        System.out.println(dept);
    }
    @Test
    public void save() throws IOException {
        SqlSession session = getSession();
        DeptMapper mapper = session.getMapper(DeptMapper.class);
        Dept dept = new Dept();
        dept.setDeptIntroduce("这是测试用的部门");
        dept.setDeptName("测试部门");
        mapper.saveDept(dept);
        session.commit();
    }
    @Test
    public void update() throws IOException {
        SqlSession session = getSession();
        DeptMapper mapper = session.getMapper(DeptMapper.class);
        Dept dept = new Dept();
        dept.setDeptId(5);
        dept.setDeptIntroduce("这是修改成功后的的部门");
        dept.setDeptName("测试部门");
        mapper.updateDept(dept);
        session.commit();
    }
    @Test
    public void delete() throws IOException {
        SqlSession session = getSession();
        DeptMapper mapper = session.getMapper(DeptMapper.class);

        mapper.deleteDeptById(5);
        session.commit();
    }
    @Test
    public void testPage(){
        DeptMapper mapper = (DeptMapper) SqlSessionUtil.getSession(DeptMapper.class);

        //需要在获取列表之前
        List<Dept> list = mapper.findAllDept();
        for (Dept dept : list) {
            System.out.println(dept);
        }

        PageHelper.startPage(1, 2);
        list = mapper.findAllDept();
        for (Dept dept : list) {
            System.out.println(dept);
        }
        PageInfo<Dept> pageInfo = new PageInfo<Dept>(list);
        System.out.println(pageInfo.getPageSize());
        // System.out.println(list);
        // System.out.println(new EasyUIResult(pageInfo.getTotal(), list));
    }
}
