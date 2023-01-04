package week_3;

import java.util.Scanner;

//    11.   상품의 개수와 단가를 입력 받아 총 금액을 계산하여 출력하시오.
//    단, 상품의 개수가 100-199 사이이면 8%, 200-299 사이이면 15%, 300개 이상이면
//    20%의 할인 금액을 적용한다. 100개 미만이면 할인 금액을 적용하지 않는다.
public class w3_11 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("상품의 개수 입력");
        int num = input.nextInt();

        System.out.println("상품의 단가 입력");
        int price = input.nextInt();

        if ( (num >= 100) & (num <= 199) ){
            System.out.println("상품의 개수 : " + num + "개");
            System.out.printf("총 비용(8%%) 할인 적용 : %.0f원" , ((num * price) - ((num * price) * (8.0/100))));
        }
        else if ( (num >= 200) & (num <= 299) ){
            System.out.println("상품의 개수 : " + num + "개");
            System.out.printf("총 비용(15%%) 할인 적용 : %.0f원",((num * price) - ((num * price) * (15.0/100))));
        }
        else if ( num > 300 ){
            System.out.println("상품의 개수 : " + num + "개");
            System.out.printf("총 비용(20%%) 할인 적용 : %.0f원",((num * price) - ((num * price) * (20.0/100))));
        }
        else{
            System.out.println("상품의 개수 : " + num + "개");
            System.out.printf("총 비용(0%%) 할인 적용 : %d원",((num * price)));
        }

        input.close();
    }
}
