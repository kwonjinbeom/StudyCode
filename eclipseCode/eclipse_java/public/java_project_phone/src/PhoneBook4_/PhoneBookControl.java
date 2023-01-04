package PhoneBook4_;

import java.util.Scanner;

public class PhoneBookControl {
    Scanner input = new Scanner(System.in);
    private int year = 0;
    String name, phoneNumber, major, company;
    private int phoneStorageNum = 0;
    private final int MAX_STORAGE_NUM = 100;
    PhoneInfo4[] pList = new PhoneInfo4[MAX_STORAGE_NUM];

    public void phoneSave(PhoneInfo4 p){
            pList[phoneStorageNum] = p;
            phoneStorageNum++;

        }
    public int search(String name){
        for (int i = 0; i < phoneStorageNum; i++) {
            if (pList[i].getName().equals(name)){
                return i;
            }
        }
        return -1;
    }
    public void phoneSearch(String searchName){
        int value = search(searchName);
        pList[value].showPhoneInfo();
        if(value >= 0)
            System.out.println("데이터 검색이 완료되었습니다.");
        else
            System.out.println("데이터가 없습니다.");
    }
    public void phoneDelete(String deleteName){
        int value = search(deleteName);
        if (value >= 0) {
            System.out.println("삭제할 데이터가 존재합니다. 삭제하시겠습니까?");
            System.out.println("1. Yes \t 2.No");
            System.out.print("선택 : ");
            int d = input.nextInt();
            if (d == 2) {
                System.out.println("삭제를 취소합니다.");
                return;
            }
            for (int i = value; i < phoneStorageNum; i++) {
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
