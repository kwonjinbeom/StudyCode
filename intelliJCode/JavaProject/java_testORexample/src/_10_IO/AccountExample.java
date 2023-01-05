package _10_IO;

import java.io.*;

class Account implements Serializable{ //직렬화시 Serializable을 수행하지 않으면 출력 안됨.
    private String accountNo;
    private String ownerName;
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
    public String toString(){
        return "계좌번호 : " + accountNo + "\n예금주명 : " + ownerName + "\n금액 : " + balance;
    }
}

public class AccountExample {
    public static void main(String[] args) {
        ObjectInputStream in = null;
        ObjectOutputStream out = null;

        try{
            out = new ObjectOutputStream(new FileOutputStream("account.dat"));
            out.writeObject(new Account("123-4535-33478", "홍길동", 100000));
            out.flush();

            in = new ObjectInputStream(new FileInputStream("account.dat"));
            Account ea = (Account)in.readObject();

            System.out.println(ea.toString());
        }catch (ClassNotFoundException c){
            System.out.println(c.getException());
        }catch (IOException e){

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            try{
                if(in != null)
                    in.close();
                if(out != null)
                    out.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
