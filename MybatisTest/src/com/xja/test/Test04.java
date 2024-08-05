package com.xja.test;

import com.xja.mapper.StuMapper;
import com.xja.pojo.Student;
import com.xja.util.SqlSessionUtil;

/**
 * @author 张志军
 * Date 2024/8/5下午7:35
 */
public class Test04 {
    public static void main(String[] args) {
        try {
            StuMapper sm= SqlSessionUtil.getMapper(StuMapper.class);
            sm.updateStuAge(10,29);
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
