package d09_14;

import java.util.Scanner;

public class ArrayExample3 {
    public static void main(String[] args) {
        int[] array = new int[10];
        Scanner input = new Scanner(System.in);
        System.out.println("첫 번째 수를 입력하세요: ");
        int num1 = input.nextInt();
        System.out.println("두 번째 수를 입력하세요: ");
        int num2 = input.nextInt();
        array[0] = num1;
        array[1] = num2;
        for (int i = 2; i < 10; i++) {
            array[i] = (array[i-2] * array[i-1]) % 10;
        }
        for (int i = 0; i < array.length; i++) {
            System.out.print( array[i]+" ");
        }

    }
}
