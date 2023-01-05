package week_5;

//    1.	1부터 100까지의 수 중에서 4의 배수의 합을 구하여 출력하는 프로그램을 작성하시오.

public class w5_1 {
    public static void main(String[] args) {
        int sum = 0;
        for (int i = 1; i <= 100; i++){
            if ( i % 4 == 0){
                sum = sum + i;
            }
        }
        System.out.println("1부터 100까지의 4의 배수의 합: " + sum);
    }
}
