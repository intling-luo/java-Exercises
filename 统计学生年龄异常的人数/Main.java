import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        int x=5,tu=0;
        Scanner in=new Scanner(System.in);
        Student  []st=new Student[10];
        String name;
        int age;
        for(int i=0;i<x;i++)
        {
            name=in.next();
            age=in.nextInt();
            st[i]=new Student(name,age);
            if(st[i].Student()==0)
            {
                tu++;
            }
        }
        if(tu==x)
        {
            System.out.println("all wrong");
        }
        else if(tu==0)
        {
            System.out.println("right");
        }
        else {
            System.out.println(tu);
            for (int i = 0; i < x; i++)
            {
                if(st[i].Student()==0)
                {

                    System.out.println(st[i].name);
                }
            }
        }
    }
}


