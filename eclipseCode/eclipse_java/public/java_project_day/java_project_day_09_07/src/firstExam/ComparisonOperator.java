package firstExam;

public class ComparisonOperator {
    public static void main(String[] args) {
        int x = 3;
        int y = 4;

        System.out.println("x == y" + (x == y)); //f
        System.out.println("x != y" + (x != y)); //t

        System.out.println("x > y" + (x > y)); //f
        System.out.println("x < y" + (x < y)); // t
        System.out.println("x <= y" + (x <= y)); // t

        char char1 = 'A';
        char char2 = 'Z';
        boolean result = (char1 < char2);
        System.out.println("result = " + result); //true
    }
}
