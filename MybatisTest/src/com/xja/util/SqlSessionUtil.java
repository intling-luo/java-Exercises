package com.xja.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class SqlSessionUtil {
    private SqlSessionUtil() {
    }

    //定义静态工厂类
    private static SqlSessionFactory ssf;

    //定义静态代码块,读取xml文件,通过xml文件创建SqlSessionFactory对象
    static {
        try (InputStream inputStream = Resources.getResourceAsStream("mybatis.xml");) {
            ssf = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //定义ThreadLocal存储SqlSession对象
    private static ThreadLocal<SqlSession> local = new ThreadLocal<>();

    /**
     * 获取SqlSession对象
     *
     * @return
     */
    private static SqlSession getSession() {
        //从ThreadLocal中获取SqlSession对象
        SqlSession sqlSession = local.get();
        if (sqlSession == null) {
            sqlSession = ssf.openSession();
            local.set(sqlSession);
        }
        return sqlSession;
    }

    /**
     * 关闭sqlSession
     */
    public static void closeSession() {
        try {
            SqlSession sqlSession = local.get();
            if (sqlSession != null) {
                sqlSession.close();
            }
        } finally {
            local.remove();
        }
    }

    /**
     * 事务提交的方法
     */
    public static void commit() {
        getSession().commit();
    }

    /**
     * 事务回滚的方法
     */
    public static void rollback() {
        getSession().rollback();
    }

    /**
     * 获取Mapper对象的方法
     */
    public static <T> T getMapper(Class<T> cls) {
        return getSession().getMapper(cls);
    }
}
