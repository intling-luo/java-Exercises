package com.xja.test;

import com.xja.mapper.StuMapper;
import com.xja.pojo.Student;
import com.xja.util.SqlSessionUtil;

import java.util.List;

/**
 * @author 张志军
 * Date 2024/8/5下午7:18
 */
public class Test03 {
    public static void main(String[] args) {
        try {
            StuMapper sm= SqlSessionUtil.getMapper(StuMapper.class);
            sm.addStudent(new Student(null,"田所","男"
                    ,19,"123456789","北京朝阳"));
            SqlSessionUtil.commit();
        }catch (Exception e)
        {
            try{
                SqlSessionUtil.rollback();
            }catch (Exception ex)
            {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        }
        finally {
            SqlSessionUtil.closeSession();
        }
    }
}
