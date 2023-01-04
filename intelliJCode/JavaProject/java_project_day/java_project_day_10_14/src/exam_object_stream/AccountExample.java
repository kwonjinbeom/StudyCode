package exam_object_stream;

import java.io.*;

class Account implements Serializable {
    private String accountNo, ownerName;
    private int balance;

    public Account(String accountNo, String ownerName, int balance) {
        this.accountNo = accountNo;
        this.ownerName = ownerName;
        this.balance = balance;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "계좌번호 : " + accountNo + '\n' +
                "예금주명 : " + ownerName + '\n' +
                "금액 : " + balance;
    }
}

public class AccountExample {
    public static void main(String[] args) {
        String file = "account.dat";
        output(file);
        input(file);
    }
    private static void output(String file){
        try(FileOutputStream fos = new FileOutputStream(file);
            ObjectOutputStream oos = new ObjectOutputStream(fos)){

            oos.writeObject(new Account("123-4535-33478", "홍길동", 100000));
        }catch (IOException e){
            System.out.println(e);
        }
    }
    private static void input(String file){
        try(FileInputStream fis = new FileInputStream(file);
            ObjectInputStream oos = new ObjectInputStream(fis)){
            while(true){
                Account a = (Account) oos.readObject();
                System.out.println(a.toString());
            }
        }catch (ClassNotFoundException e){
            System.out.println("클래스를 찾을 수 없습니다.");
        }catch (IOException io){

        }
    }
}
