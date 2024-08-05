package com.xja.test;

import com.xja.mapper.StuMapper;
import com.xja.pojo.Student;
import com.xja.util.SqlSessionUtil;

import java.util.List;

/**
 * @author 张志军
 * Date 2024/8/5下午7:08
 */
public class Test02 {
    public static void main(String[] args) {
        StuMapper sm= SqlSessionUtil.getMapper(StuMapper.class);
        List<Student> studentList = sm.selectForSur("老");
        SqlSessionUtil.closeSession();
        for (Student student:studentList)
        {
            System.out.println(student);
        }
    }
}
