// 定义一个有关学生的Student类，内含类成员变量：
// String name、String sex、int age，所有的变量必须为私有(private)。

// 1.编写有参构造函数：
// 能对name,sex,age赋值。

// 2.覆盖toString函数：

// 按照格式：类名 [name=, sex=, age=]输出。使用idea自动生成,然后在修改成该输出格式

// 3.对每个属性生成setter/getter方法

// 4.main方法中

// •输入1行name age sex , 调用上面的有参构造函数新建对象。




import java.util.Scanner;
public class Main {
    public static void main(String[] args){
        Scanner st=new Scanner(System.in);
        String name= st.next();
        int age=Integer.valueOf(st.next());
        String sex=st.next();
        Student student=new Student(name,sex,age );
        System.out.println(student);
    }

}

class Student
{
     private String name;
     private String sex;
     private int age;
     
     public String toString()
     {
    	 String str ="Student [name='"+name+"', sex='"+sex+"', age="+age+"]";
    	 return str;
     }
     
     
     public Student(String name,String sex,int age)
     {
    	 this.name=name;
         this.sex=sex;
         this.age=age;
     }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

 
 
 }
