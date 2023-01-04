package firstExam;

public class IncreaseDecreaseOperatorExample {
    public static void main(String[] args) {
        int x = 10;
        int y = 10;
        int z;
//1
        System.out.println("-------------------");
        x++;
        ++x;
        System.out.println("x=" + x );
//2
        System.out.println("-------------------");
        y--;
        --y;
        System.out.println("y=" + y );
//3
        System.out.println("-------------------");
        z = x++;

        System.out.println("z=" + z );
        System.out.println("x=" + x );
//4
        System.out.println("-------------------");
        z = ++x;

        System.out.println("z=" + z );
        System.out.println("x=" + x );
//5
        System.out.println("-------------------");

        z = ++x + y++;

        System.out.println("z=" + z );
        System.out.println("x=" + x );
        System.out.println("y=" + y );


    }
}
