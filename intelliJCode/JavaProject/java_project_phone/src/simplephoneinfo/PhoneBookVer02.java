package simplephoneinfo;

import java.util.Scanner;

public class PhoneBookVer02 {
    static Scanner input = new Scanner(System.in);
    static int num;

    public static void main(String[] args) {
        do {
            menu();
            switch (num) {
                case 1: //데이터 입력
                    phoneWrite();
                    break;
                case 2: //프로그램 종료
                    phoneOut();
                    break;
            }
        } while (num != 2);
    }

    public static int menu(){
        System.out.println("선택하세요.\n1. 데이터 입력\n2. 프로그램 종료");
        num = input.nextInt();
        System.out.println("선택: " + num);
        return num;
    }
    public static void phoneWrite(){
        System.out.print("이름: ");
        String name = input.next();
        System.out.print("전화번호: ");
        String phoneNumber = input.next();
        System.out.print("생년월일: ");
        String birthday = input.next();
        if (birthday.equals(""))
            birthday = null;

        PhoneInfo p = new PhoneInfo(name, phoneNumber, birthday);
        p.showPhoneInfo(); //데이터 출력
    }
    public static void phoneOut(){
        System.out.println("프로그램을 종료합니다.");
    }
}
