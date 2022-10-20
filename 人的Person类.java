// 7-1 jmu-Java-03面向对象基础-01-构造方法与toString
// 分数 3
// 作者 郑如滨
// 单位 集美大学
// 定义一个有关人的Person类，内含属性：
// String name、int age、boolean gender、int id，所有的变量必须为私有(private)。
// 注意：属性顺序请严格按照上述顺序依次出现。

// 1.编写无参构造函数：
// 打印"This is constructor"。
// 将name,age,gender,id按照name,age,gender,id格式输出
// 2.编写有参构造函数
// 依次对name,age,gender赋值。

// 3.覆盖toString函数：
// 按照格式：类名 [name=, age=, gender=, id=]输出。建议使用Eclipse自动生成.

// 4.对每个属性生成setter/getter方法
// 5.main方法中
// 首先从屏幕读取n，代表要创建的对象个数。
// 然后输入n行name age gender , 调用上面2编写的有参构造函数新建对象。
// 然后将刚才创建的所有对象逆序输出。
// 接下来使用无参构造函数新建一个Person对象，并直接打印该对象。
// 输入样例:
// 3
// a 11 false
// b 12 true
// c 10 false
// 输出样例:
// Person [name=c, age=10, gender=false, id=0]
// Person [name=b, age=12, gender=true, id=0]
// Person [name=a, age=11, gender=false, id=0]
// This is constructor
// null,0,false,0
// Person [name=null, age=0, gender=false, id=0]




import java.util.Scanner;
public class Main {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		Scanner st=new Scanner(System.in);
		int x=st.nextInt();
		Person pr[]=new Person[x];
		for(int i=0;i<x;i++)
		{
	        String name= st.next();
	        int age=st.nextInt();
	        boolean gender=st.nextBoolean();
	        pr[i] =new Person(name,age,gender);
	        
		}
		for(int i=x-1;i>=0;i--)
		{
			pr[i].toString();
			pr.toString();
			
		}
		Person sb=new Person();
		
	    
	}

    
}
class Person
{
     private String name;
     private int age;
     private boolean gender;
     private int id;
     
     public  Person()
     {
    	 System.out.println("This is constructor");
         System.out.println(name+","+age+","+gender+","+id);
         System.out.println("Person [name="+name+", age="+age+", gender="+gender+", id="+id+"]");
     }
     
    
     public Person(String name,int age,boolean gender)
     {
    	 this.name=name;
         this.age=age;
         this.gender=gender;
     }
     
     public String toString()
     {
    	 System.out.println("Person [name="+name+", age="+age+", gender="+gender+", id="+id+"]");
    	 return name;
     }
     
     
     

}
