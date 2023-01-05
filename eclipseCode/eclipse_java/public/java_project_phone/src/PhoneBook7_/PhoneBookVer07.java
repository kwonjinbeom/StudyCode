package PhoneBook7_;

import java.util.Scanner;

public class PhoneBookVer07 {
    public static void main(String[] args) {
        int choiceNum = 0;
        PhonebookUI UI = new PhonebookUI();
        Scanner input = new Scanner(System.in);
        do{
            try {
                UI.startMenuUI();
                choiceNum = input.nextInt();
                if (choiceNum < PhoneMenuString.PHONE_SAVE_UI || choiceNum > PhoneMenuString.PHONE_QUIT)
                    throw new PhoneChoiceError(choiceNum);
                switch (choiceNum) {
                    case PhoneMenuString.PHONE_SAVE_UI: //데이터 입력
                        UI.phoneSaveUI();
                        break;
                    case PhoneMenuString.PHONE_SEARCH_UI: //데이터 검색
                        UI.phoneSearchUI();
                        break;
                    case PhoneMenuString.PHONE_DELETE_UI: //데이터 삭제
                        UI.phoneDeleteUI();
                        break;
                    case PhoneMenuString.SHOW_ALL_PHONEINFO: //모든 데이터 보기
                        UI.showAllPhoneInfo();
                        break;
                    case PhoneMenuString.PHONE_QUIT://프로그램 종료
                        break;

                }
            }catch (PhoneChoiceError e){
                e.showWrongMenu();
            }
        }while(choiceNum!=5);
        System.out.println("프로그램을 종료합니다.");
    }
}
