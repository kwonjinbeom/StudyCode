package PhoneBook4_;

import java.util.Scanner;

public class PhoneBookVer04 {
    public static void main(String[] args) {
        int choiceNum;
        PhonebookUI UI = new PhonebookUI();
        Scanner input = new Scanner(System.in);
        do{
            UI.startMenuUI();
            choiceNum = input.nextInt();
            switch (choiceNum) {
                case 1: //데이터 입력
                    UI.phoneSaveUI();
                    break;
                case 2: //데이터 검색
                    UI.phoneSearchUI();
                    break;
                case 3: //데이터 삭제
                    UI.phoneDeleteUI();
                    break;
                case 4: //모든 데이터 보기
                    UI.showAllPhoneInfo();
                    break;
                case 5://프로그램 종료
                    break;
                default:
                    System.out.println("번호를 잘못 입력하셨습니다.");
            }
        }while(choiceNum!=5);
        System.out.println("프로그램을 종료합니다.");
    }
}
