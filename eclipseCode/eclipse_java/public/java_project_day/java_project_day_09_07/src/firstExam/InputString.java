package firstExam;

import java.util.Scanner;

public class InputString {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String name, address;
        int age;

        System.out.print("이름을 입력해주세요 : ");
        name = input.next();

        System.out.print("나이를 입력해주세요 : ");
        age = input.nextInt();
        input.nextLine(); // 아래 엔터를 방지해주기 위해

        System.out.print("주소를 입력해주세요 : ");
        address = input.nextLine();

        System.out.println(name + "님 안녕하세요!" + age + "살이시네요.\n주소는 " + address);

        input.close();
    }
}
