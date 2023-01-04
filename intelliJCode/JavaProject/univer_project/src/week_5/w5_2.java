package week_5;
//2.	구구단 2단을 다음과 같이 출력하는 프로그램을 반복문을 사용하여 작성하시오.
//    { ** 2단 **
//        2 * 1 = 2
//        2 * 3 = 6
//        2 * 5 = 10
//        2 * 7 = 14
//        2 * 8 = 16 }
public class w5_2 {
    public static void main(String[] args) {
        for (int i =2; i <= 2; i++){
            for (int j = 1; j <= 9; j = j+2){
                if(j != 9){
                    System.out.printf("%d * %d = %d\n",i,j,i*j);
                }else{
                    j = 8;
                    System.out.printf("%d * %d = %d\n",i,j,i*j);
                }
            }
        }
    }
}
