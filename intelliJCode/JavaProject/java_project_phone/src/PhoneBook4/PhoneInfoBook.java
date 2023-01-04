package PhoneBook4;

import java.util.Scanner;

public class PhoneInfoBook {
    Scanner input = new Scanner(System.in);
    int year = 0;
    String name, phoneNumber, major, company;
    int phoneStorageNum = 0;
    PhoneInfo4[] pList = new PhoneInfo4[100];

    public void phoneSave(){
        if(phoneStorageNum>100)
            System.out.println("정보의 최대 개수인 100개를 초과하였습니다. 입력을 종료합니다.");
        else {
            System.out.println("데이터 입력을 시작합니다.");
            System.out.println("1.일반\t2.대학\t3.회사");
            int numChoice = input.nextInt();
            switch (numChoice){
                case 1:
                    System.out.print("이름: ");
                    name = input.next();
                    System.out.print("전화번호: ");
                    phoneNumber = input.next();
                    pList[phoneStorageNum] = new PhoneInfo4(name,phoneNumber);
                    phoneStorageNum++;
                    System.out.println("데이터 입력이 완료되었습니다.");
                    break;
                case 2:
                    System.out.print("이름: ");
                    name = input.next();
                    System.out.print("전화번호: ");
                    phoneNumber = input.next();
                    System.out.print("전공: ");
                    major = input.next();
                    System.out.print("학년: ");
                    year = input.nextInt();
                    pList[phoneStorageNum] = new PhoneUnivInfo(name,phoneNumber,major,year);
                    phoneStorageNum++;
                    System.out.println("데이터 입력이 완료되었습니다.");
                    break;
                case 3:
                    System.out.print("이름: ");
                    name = input.next();
                    System.out.print("전화번호: ");
                    phoneNumber = input.next();
                    System.out.print("회사: ");
                    company = input.next();
                    pList[phoneStorageNum] = new PhoneCompanyInfo(name,phoneNumber,company);
                    phoneStorageNum++;
                    System.out.println("데이터 입력이 완료되었습니다.");
                    break;
            }
        }
    }
    public void phoneSearch(){
        boolean b = false;
        System.out.println("선택 : 2");
        System.out.println("데이터 검색을 시작합니다.");
        System.out.print("이름 :");
        String searchName = input.next();
        for (int i = 0; i < phoneStorageNum; i++) {
            if(pList[i].getName().equals(searchName))
                pList[i].showPhoneInfo();
                b = true;
        }
        if(b==false)
            System.out.println("데이터가 없습니다.");
        else
            System.out.println("데이터 검색이 완료되었습니다.");
    }
    public void phoneDelete(){
        boolean deleteKey = false;
        int deletePoint = 0;
        System.out.println("선택 : 3");
        System.out.println("데이터 삭제를 시작합니다.");
        System.out.print("이름 :");
        String deleteName = input.next();
        for (int i = 0; i < phoneStorageNum; i++) {
            if(pList[i].getName().equals(deleteName)){
                deletePoint = i;
                deleteKey = true;
            }
        }

        if (deleteKey) {
            for (int i = deletePoint; i < phoneStorageNum; i++) {
                pList[i] = pList[i+1];
            }
            pList[phoneStorageNum - 1] = null;
            phoneStorageNum--;
            System.out.println("삭제가 완료되었습니다.");
        }else{
            System.out.println("삭제할 데이터가 없습니다..");
        }
    }

    public void phonePrint(){
        for (int i = 0; i < phoneStorageNum; i++) {
            pList[i].showPhoneInfo();
            System.out.println();
        }
    }
    public String toString(){
        return name + " " + phoneNumber;
    }

}
