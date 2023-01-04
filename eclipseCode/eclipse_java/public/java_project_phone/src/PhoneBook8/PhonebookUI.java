package PhoneBook8;

import java.util.Scanner;

public class PhonebookUI {

    Scanner input = new Scanner(System.in);
    int year = 0;
    String name, phoneNumber, major, company;
    PhoneBookControl PbControl = new PhoneBookControl(); //PhoneBookControl의 객체 생성
    PhoneInfo8 p; //PhoneInfo8 클래스의 객체를 담을 p

    public void dataBackUp(){ //데이터 불러오기(Main 10줄)
        PbControl.phoneRead();
        System.out.println("이전 데이터 불러오기 완료!!");
    }
    public void dataSave(){ //데이터 저장하기(program 종료 시)
        PbControl.phoneWrite();
        System.out.println("파일을 저장하였습니다.");
    }
    public void startMenuUI(){ //메뉴 UI
        System.out.println();
        System.out.println("선택하세요...\n1.데이터 입력\n2.데이터 검색\n3.데이터 삭제\n4.모든 데이터 보기\n5.프로그램 종료");
        System.out.print("선택 >> ");
    }
    public void phoneSaveUI() throws PhoneChoiceError { //데이터 입력 UI
        System.out.println("데이터 입력을 시작합니다.");
        System.out.println("1.일반\t2.대학\t3.회사");
        int numChoice = input.nextInt();
        if (numChoice < PhoneMenuString.GENERAL || numChoice > PhoneMenuString.COMPANY)
            throw new PhoneChoiceError(numChoice);
        switch (numChoice) {
            case PhoneMenuString.GENERAL: //일반
                System.out.print("이름: ");
                name = input.next();
                System.out.print("전화번호: ");
                phoneNumber = input.next();
                p = new PhoneInfo8(name, phoneNumber);
                break;
            case PhoneMenuString.UNIVERCITY: //대학
                System.out.print("이름: ");
                name = input.next();
                System.out.print("전화번호: ");
                phoneNumber = input.next();
                System.out.print("전공: ");
                major = input.next();
                System.out.print("학년: ");
                year = input.nextInt();
                p = new PhoneUnivInfo(name, phoneNumber, major, year);
                break;
            case PhoneMenuString.COMPANY: //회사
                System.out.print("이름: ");
                name = input.next();
                System.out.print("전화번호: ");
                phoneNumber = input.next();
                System.out.print("회사: ");
                company = input.next();
                p = new PhoneCompanyInfo(name, phoneNumber, company);
                break;
        }
        if (PbControl.phoneSave(p) == false)
        System.out.println("이미 등록된 이름입니다.");
        else{
            PbControl.phoneSave(p);
            System.out.println("데이터 입력이 완료되었습니다.");
        }
    }
    public void phoneSearchUI(){ //데이터 검색 UI
        System.out.println("선택 : 2");
        System.out.println("데이터 검색을 시작합니다.");
        System.out.print("이름 :");
        String searchName = input.next();
        PbControl.phoneSearch(searchName);
    }
    public void phoneDeleteUI() throws PhoneChoiceError { //데이터 삭제 UI
        System.out.println("선택 : 3");
        System.out.println("데이터 삭제를 시작합니다.");
        System.out.print("이름 :");
        String deleteName = input.next();
        PbControl.phoneDelete(deleteName);

    }
    public void showAllPhoneInfo(){
        PbControl.phonePrint();
    } //모든 데이터 보기 UI

}
