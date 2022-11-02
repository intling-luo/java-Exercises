//动物发生模拟器.  请在下面的【】处添加代码。
public class Main {
    public static void main(String[] args) {
        Cat cat = new Cat();
        Dog dog = new Dog();
        Goat goat = new Goat();
        speak(cat);
        speak(dog);
        speak(goat);
    }
    //定义静态方法speak()
    private static void speak(Animal animal)
    {

        System.out.println(animal.getAnimalClass()+"的叫声："+animal.shout());
    }

}



abstract class Animal {
    public abstract String getAnimalClass();
    public abstract String shout();
}


//基于Animal类，定义猫类Cat，并重写两个抽象方法
class Cat extends Animal{

    public String getAnimalClass()
    {
        return "猫";
    }
    public String shout()
    {
        return "喵喵";
    }
}
//基于Animal类，定义狗类Dog，并重写两个抽象方法
class Dog extends Animal{
    public   String getAnimalClass()
    {
        return "狗";
    }
    public String shout()
    {
        return "汪汪";
    }
}
//基于Animal类，定义山羊类Goat，并重写两个抽象方法
class Goat extends Animal{
    public String getAnimalClass() {
        return "山羊";
    }

    public String shout() {
        return "咩咩";
    }
}

