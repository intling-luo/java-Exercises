package com.xja.mapper;

import com.xja.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 张志军
 * Date 2024/8/5下午5:51
 */
public interface StuMapper {

    /**
     * 查询所有数据
     * @return Student对象集合
     */
    List<Student> selectAll();

    /**
     * 根据姓查学生
     * @param studentSur 学生姓
     * @return Student对象集合
     */
    List<Student> selectForSur(String studentSur);

    /**
     * 添加学生
     * @param student 学生对象
     */
    void addStudent(Student student);

    /**
     * 修改指定编号的学生年龄
     * @param studentId 要查找的学生编号
     * @param studentAge 学生年龄
     */
    void updateStuAge(@Param("studentId") int studentId, @Param("newAge")int studentAge);

    /**
     * 根据编号删除学生信息
     * @param studentId 编号
     */
    void deleteForId(int studentId);
}
