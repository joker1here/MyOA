package oa.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class SqlSessionUtil {
    public static Object getSession(Object object){
        try{
            //获得核心配置对象
            InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapConfig.xml");
            //获得session工厂对象
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            //获得session会话对象
            SqlSession sqlSession = sqlSessionFactory.openSession(true);
            return sqlSession.getMapper((Class<Object>) object);
        }catch (IOException e){
            System.out.println(object+"get sqlSession is wrong!");
        }
        return null;
    }
}
