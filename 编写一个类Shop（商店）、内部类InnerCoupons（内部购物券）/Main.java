import java.util.Scanner;

public class Main {
    public static void main(String[] args)
    {
        int a;
        Shop myshop=new Shop();
        Scanner in =new Scanner(System.in);
        a=in.nextInt();
        myshop.setMilkCount(a);
        myshop.coupons50.buy();
        System.out.println("牛奶还剩"+myshop.getMilkCount()+"箱");
        myshop.coupons100.buy();
        System.out.println("牛奶还剩"+myshop.getMilkCount()+"箱");

    }
}
class Shop {
     InnerCoupons coupons100=new InnerCoupons(100);
     InnerCoupons coupons50=new InnerCoupons(50);
    public int getMilkCount() {
        return milkCount;
    }


    public void setMilkCount(int milkCount) {
        this.milkCount = milkCount;
    }

    private int milkCount;

    class InnerCoupons {
        public int value;
        public InnerCoupons(int value)
        {
            this.value=value;
        }
        public void buy()
        {

            System.out.println("使用了面值为"+value+"的购物券进行支付");
            milkCount-=value/50;
        }

    }


}
