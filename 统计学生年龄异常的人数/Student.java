public class Student {

    int age;
    String name;

    public Student(String name, int age)
    {
        this.name=name;
        this.age=age;
    }


    int Student()
    {
        if(age>0)
            return 1;
        else
            return 0;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


}
