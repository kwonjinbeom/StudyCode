package PhoneBook7;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class PhoneBookControl {
    Scanner input = new Scanner(System.in);
    private int year = 0;
    String name, phoneNumber, major, company;
//    private int phoneStorageNum = 0;
//    private final int MAX_STORAGE_NUM = 100;
//    PhoneInfo7[] pSet = new PhoneInfo7[MAX_STORAGE_NUM];
    Set<PhoneInfo7> pSet = new HashSet<>();
    Iterator<PhoneInfo7> iter = pSet.iterator();


    public boolean phoneSave(PhoneInfo7 p){
            return pSet.add(p);
//            phoneStorageNum++;
        }
//    public int search(String name){
//        for (int i = 0; i < phoneStorageNum; i++) {
//            if (pList[i].getName().equals(name)){
//                return i;
//            }
//        }
//        return -1;
//    }
    public void phoneSearch(String searchName){
        iter = pSet.iterator();
        boolean result = false;
        while(iter.hasNext()){
            PhoneInfo7 iterNext = iter.next();
            if(searchName.equals(iterNext.getName())){
                iterNext.showPhoneInfo();
               result = true;
            }
        }
        if(result == false){
            System.out.println("이름을 잘못입력하셨습니다.");
        }
    }
    public void phoneDelete(String deleteName) throws PhoneChoiceError {
        iter = pSet.iterator();
        while(iter.hasNext()) {
            PhoneInfo7 iterNext = iter.next();
            if (deleteName.equals(iterNext.getName())) {
                System.out.println("삭제할 데이터가 존재합니다. 삭제하시겠습니까?");
                System.out.println("1. Yes \t 2.No");
                System.out.print("선택 : ");
                int deleteChoice = input.nextInt();
                if (deleteChoice < 1 || deleteChoice > 2)
                    throw new PhoneChoiceError(deleteChoice);
                switch (deleteChoice) {
                    case 1:
                        iter.remove();
                        System.out.println("삭제가 완료되었습니다.");
                        break;
                    case 2:
                        System.out.println("삭제를 취소합니다.");
                        break;
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                }

            } else {
                System.out.println("삭제할 데이터가 없습니다..");
            }
        }
    }


//        if (value >= 0) {
//            System.out.println("삭제할 데이터가 존재합니다. 삭제하시겠습니까?");
//            System.out.println("1. Yes \t 2.No");
//            System.out.print("선택 : ");
//            int deleteChoice = input.nextInt();
//            if(deleteChoice < 1 || deleteChoice > 2)
//                throw new PhoneChoiceError(deleteChoice);
//            switch (deleteChoice){
//                case 1:
//                    for (int i = value; i < phoneStorageNum; i++) {
//                        pSet[i] = pSet[i+1];
//                    }
//                    pSet[phoneStorageNum - 1] = null;
//                    phoneStorageNum--;
//                    System.out.println("삭제가 완료되었습니다.");
//                    break;
//                case 2:
//                    System.out.println("삭제를 취소합니다.");
//                    break;
//                default:
//                    System.out.println("잘못 입력하셨습니다.");
//            }
//
//        }else{
//            System.out.println("삭제할 데이터가 없습니다..");
//        }
//    }

    public void phonePrint(){
        iter = pSet.iterator();
        while(iter.hasNext()){
            iter.next().showPhoneInfo();
        }
    }

    public String toString(){
        return name + " " + phoneNumber;
    }

}
