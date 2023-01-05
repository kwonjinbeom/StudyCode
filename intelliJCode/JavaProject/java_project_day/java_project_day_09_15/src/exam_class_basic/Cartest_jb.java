package exam_class_basic;

import java.util.Scanner;

public class Cartest_jb {
    public static void main(String[] args) {
        Car_jb car = new Car_jb();

        int speed_value = 0;
        int geer_value = 0;
        String car_color = " ";

        Scanner input = new Scanner(System.in);

        do {
            System.out.println();
            System.out.println("==================================");
            System.out.println("원하는 속도 값을 입력해주세요(종료 = 0):");
            speed_value = input.nextInt();
            if (speed_value == 0){
                System.out.println("종료됩니다.");
                break;
            }
            System.out.println("원하는 기어 값을 입력해주세요:");
            geer_value = input.nextInt();
            car.geerControl(geer_value); // 메서드 호출

            System.out.println("원하는 색상을 입력해주세요:");
            car_color = input.next();
            car.color = car_color; //객체의 필드 변경

            if (speed_value > 0) {
                car.speedUp(speed_value);

            } else if (speed_value < 0) {
                car.speedDown(-speed_value);

            }
            //Print
            System.out.println(car.toString()); //출력방법 1
//            car.printData(); //출력방법 2
        }while (geer_value != 0);

    }
}
