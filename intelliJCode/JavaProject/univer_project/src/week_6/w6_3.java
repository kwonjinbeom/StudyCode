package week_6;

public class w6_3 {
    public static void main(String[] args) {
        int num = 2;
        System.out.println("{** "+num+"단 **");
        for (int i = 1; i < 10; i+=2) {
            System.out.printf("%d * %d = %d\n",num,i,num*i);
        }
    }
}
