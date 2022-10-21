
public class Main {
    public static void main(String[] args){

        Student []book=new Student[4];
        book[0]=new Student("Java程序设计",1,34.5);
        book[1]=new Student("数据结构",2,44.8);
        book[2]=new Student("C++程序设计",3,35.0);
        for(int i=0;i<3;i++)
        {
            book[i].pri();
        }
        System.out.println("图书总册数为："+Student.num);
    }

}

class Student
{
    private String name;
    private int sex;
    private double price;
    static int num=0;
     void pri()
    {
        System.out.println("书名："+name+", 书号："+sex+", 书价："+price+"");
    }

    Student(String name,int sex,double price)
    {
        this.name=name;
        this.sex=sex;
        this.price=price;
        num++;
    }

}