package exam_if;

public class WhileExample {
    public static void main(String[] args) {
//        int i = 1;
//        System.out.println("정수:");
//        while(i<=5){
//            System.out.println(i+" ");
//            i++;
//        }
//        System.out.println();
//
//        i = 5;
//        System.out.println("정수: ");
//        while(true){
//            System.out.println(i+" ");
//            i--;
//            if(i < 1){
//                break;
//            }
//        }
//        System.out.println();

        int num = 1, sum = 0;
        while(num <= 100){
            sum = sum + num++;
//            num =num + 1;
        }
        System.out.println("1부터 100까지의 합 = " + sum + "입니다.");
    }
}
