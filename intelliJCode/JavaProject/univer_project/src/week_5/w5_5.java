package week_5;
//5.	1부터 100까지의 합을 구하여
// 구하여 출력하는 프로그램을 do-while문을 사용하여 작성하시오. 10을 기준으로 합계를 출력한다.
//    { 1 – 10 : 0000
//        1 – 20 : 0000
//        1 – 30 : 0000
//            . . . . .
//        1 – 100 : 5050 }
public class w5_5 {
    public static void main(String[] args) {
        int num1 = 1;
        int num2 = 1;
        int num3 = 10;
        int sum = 0;

        do {
            if(num1 <= num3){
                    sum = sum + num1;
                if(num1 == 100){
                    System.out.printf("1 - %d : %d\n", num3, sum);
                }
            }else{
                if(num3%10 == 0) {
                    if(num3 != 10) {
                        System.out.printf("1 - %d : %d\n", num3, sum);
                        num2++;
                        num3 = num2 * 10;
                        num1 = 0;
                        sum = 0;
                    }else{
                        System.out.printf("1 - %d : %d\n", num3, sum);
                        num2++;
                        num3 = num2 * 10;
                        num1 = 0;
                        sum = 0;
                    }
                }
            }
            num1++;
        } while (num1 <= 100);



    }
}
