package day09_8;

import java.util.Scanner;
//x개의 사탕을 y명의 학생들에게 똑같이 나누어주려고 할 때, 각 학생들이
// 받을 수 있는 사탕의 수와 남는 사탕의 수를 계산해 출력하는 프로그램을 작성하시오.
public class test2 {
    public static void main(String[] args) {
        int give_candy, n_give_candy;
        Scanner input = new Scanner(System.in);
        System.out.println("사탕 수 입력");
        int candy = input.nextInt();
        System.out.println("학생 수 입력");
        int student = input.nextInt();

        give_candy = candy/student;
        n_give_candy = candy%student;
        System.out.printf("받을 수 있는 사탕 수: %d 남은 사탕의 수: %d",give_candy,n_give_candy);
        input.close();
    }
}
