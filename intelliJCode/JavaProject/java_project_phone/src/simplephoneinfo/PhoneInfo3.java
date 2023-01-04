package simplephoneinfo;

import java.util.Scanner;

public class PhoneInfo3 {
    public String name;
    public String phoneNumber;
    public String birthday;
    int phoneStorageNum = 0;
    String[][] phoneStorage = new String[100][];

    Scanner input = new Scanner(System.in);

    PhoneInfo3(){}

    PhoneInfo3(String name, String phoneNumber,String birthday){
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.birthday = birthday;
    }

    public String getName(){return name;}
    public void setName(String name){this.name = name;}
    public String getPhoneNumber(){return phoneNumber;}
    public void setPhoneNumber(String phoneNumber){this.phoneNumber = phoneNumber;}

    public String getBirthday(){return birthday;}
    public void setBirthday(String birthday){this.birthday = birthday;}
    public void showPhoneInfo(){
        System.out.println("name: "+ name + "\nphone: " + phoneNumber + "\nbirth: " + birthday);
    }

    public void phoneSave(){
        if(phoneStorageNum>100)
            System.out.println("정보의 최대 개수인 100개를 초과하였습니다. 입력을 종료합니다.");
        else {

            System.out.println("데이터 입력을 시작합니다.");
            System.out.print("이름: ");
            name = input.next();
            System.out.print("전화번호: ");
            phoneNumber = input.next();
            System.out.print("생년월일: ");
            birthday = input.next();
            phoneStorage[phoneStorageNum] = new String[]{name, phoneNumber, birthday};
            phoneStorageNum++;
            System.out.println("데이터 입력이 완료되었습니다.");
        }
    }
    public void phoneSearch(){
        boolean b = false;

        System.out.println("데이터 검색을 시작합니다.");
        System.out.print("이름 :");
        String searchName = input.next();
        for (int i = 0; i < phoneStorageNum; i++) {
            for (int j = 0; j < phoneStorage[i].length; j++) {
                if(phoneStorage[i][j].equals(searchName)){
                    System.out.println("이름: " + phoneStorage[i][j]);
                    System.out.println("전화번호: " + phoneStorage[i][j+1]);
                    System.out.println("생년월일: " + phoneStorage[i][j+2]);
                    b = true;
                }
            }
        }
        if(b==false)
            System.out.println("데이터가 없습니다.");
        else
            System.out.println("데이터 검색이 완료되었습니다.");
    }
    public void phoneDelete(){
        boolean deleteKey = false;
        int deletePoint = 0;

        System.out.println("데이터 삭제를 시작합니다.");
        System.out.print("이름 :");
        String deleteName = input.next();
        for (int i = 0; i < phoneStorageNum; i++) {
            for (int j = 0; j < phoneStorage[i].length; j++) {
                if(phoneStorage[i][j].equals(deleteName)){
                    deletePoint = i;
                    deleteKey = true;
                }
            }
        }
        if (deleteKey) {
            for (int i = deletePoint; i < phoneStorageNum; i++) {
                phoneStorage[i] = phoneStorage[i + 1];
            }
            phoneStorage[phoneStorageNum - 1] = null;
            phoneStorageNum--;
            System.out.println("삭제가 완료되었습니다.");
        }else{
            System.out.println("삭제할 데이터가 없습니다..");
        }
    }

    public void phonePrint(){
        System.out.println("이름\t\t전화번호\t\t\t생년월일");
        for (int i = 0; i < phoneStorageNum; i++) {
            for (int j = 0; j < phoneStorage[i].length; j++) {
                System.out.print(phoneStorage[i][j]+"\t");
            }
            System.out.println();
        }
    }
}
