package week_6;

public class w6_7 {
    public static void main(String[] args) {
        int sum = 1;
        for (int i = 0; i < 15; i++) {
            System.out.print((sum += i) + " ");
        }
    }
}
