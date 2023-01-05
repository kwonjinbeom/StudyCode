package week_6;

import java.util.Scanner;

public class w6_4 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("N값을 입력하시오: ");
        int num = scan.nextInt();
        int i;
        int sum = 0;
        for (i = 3; i < num; i+=3) {
            sum += i;
        }
        System.out.println("{ 사용자 입력: " + num);
        System.out.println(num + "을 넘었을 때의 값: " + (i));
        System.out.println(num + "을 넘었을때가지의 총 합계 : " + sum);
        System.out.println(num + "을 넘었을 때까지 몇 번째 3의 배수인가 : " + (i/3) + " }");
    }
}
