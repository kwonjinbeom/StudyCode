package firstExam;

import java.util.Scanner;

// 이름, 도시, 나이, 체중, 독신 여부(true/false)를 입력받아 여러분이 원하는 형태로 출력해 주시면 됩니다.
public class ScannerExample {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String name, city;
        int age, weight;
        boolean marry;

        System.out.print("이름을 입력해주세요 : ");
        name = input.next();

        System.out.print("도시를 입력해주세요 : ");
        input.nextLine();
        city = input.nextLine();

        System.out.print("나이를 입력해주세요 : ");
        age = input.nextInt();

        System.out.print("체중를 입력해주세요 : ");
        weight = input.nextInt();

//        System.out.print("독신을 입력해주세요 : ");
//        marry = input.nextBoolean();

        if( (age > 19) & (weight < 100) ){
            marry = true;
        }else{
            marry = false;
        }
        System.out.println("나의 이름:" + name);
        System.out.println("나의 도시:" + city);
        System.out.println("나의 나이:" + age);
        System.out.println("나의 체중:" + weight);
        System.out.println("나의 독신 여부:" + marry);

        input.close();
    }
}
