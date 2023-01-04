package exam_variable;

public class test1 {
    public static void main(String[] args) {
        int a = 3;
        int b = 5;
        int c;
        System.out.println("교환 전 a와 b 의 값: "+ "a = " + a + " b = " + b);
        c = a;
        a = b;
        b = c;
        System.out.println("교환 후 a와 b 의 값: "+ "a = " + a + " b = " + b);
    }
}
