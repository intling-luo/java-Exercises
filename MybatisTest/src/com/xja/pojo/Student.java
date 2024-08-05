package com.xja.pojo;

/**
 * @author 张志军
 * Date 2024/8/5下午5:58
 */
public class Student {
    private Integer studentId;
    private String studentName;
    private String studentSex;
    private Integer studentAge;
    private String studentPhone;
    private String studentAddress;

    @Override
    public String toString() {
        return "Emp{" +
                "studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", studentSex='" + studentSex + '\'' +
                ", studentAge=" + studentAge +
                ", studentPhone='" + studentPhone + '\'' +
                ", studentAddress='" + studentAddress + '\'' +
                '}';
    }

    public Student() {
    }

    public Student(Integer studentId, String studentName, String studentSex, Integer studentAge, String studentPhone, String studentAddress) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentAge = studentAge;
        this.studentPhone = studentPhone;
        this.studentAddress = studentAddress;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public Integer getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(Integer studentAge) {
        this.studentAge = studentAge;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    public String getStudentAddress() {
        return studentAddress;
    }

    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress;
    }
}
