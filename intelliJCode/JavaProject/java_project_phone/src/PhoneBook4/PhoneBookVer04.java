package PhoneBook4;

import java.util.Scanner;

public class PhoneBookVer04 {
    public static void main(String[] args) {
        int phoneChoiceNum;
        PhoneInfoBook book = new PhoneInfoBook();
        PhoneCompanyInfo companyInfo = new PhoneCompanyInfo();
        PhoneUnivInfo phoneUnivInfo = new PhoneUnivInfo();
        Scanner input = new Scanner(System.in);
        do{
            System.out.println("선택하세요...\n1.데이터 입력\n2.데이터 검색\n3.데이터 삭제\n4.모든 데이터 보기\n5.프로그램 종료");
            System.out.print("선택 >> ");
            phoneChoiceNum = input.nextInt();
            switch (phoneChoiceNum) {
                case 1: //데이터 입력
                    book.phoneSave();
                    break;
                case 2: //데이터 검색
                    book.phoneSearch();
                    break;
                case 3: //데이터 삭제
                    book.phoneDelete();
                    break;
                case 4: //모든 데이터 보기
                    book.phonePrint();
                    break;
                case 5://프로그램 종료
                    break;
                default:
                    System.out.println("번호를 잘못 입력하셨습니다.");
            }
        }while(phoneChoiceNum!=5);
        System.out.println("프로그램을 종료합니다.");
    }
}
