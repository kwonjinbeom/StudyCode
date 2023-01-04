package AccountManager;

import java.util.Scanner;

class Account {
    Scanner scan = new Scanner(System.in);
    private String ano;
    private String owner;
    private int balance;
    Account[] accountList = new Account[999];
    int accountIndex = 0;

    Account() {
    }

    Account(String ano, String owner, int balance) {
        this.ano = ano;
        this.owner = owner;
        this.balance = balance;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public void manual(int choice) {
        if (choice == 1)
            System.out.println("------------\n1.계좌생성\n------------");
        else if (choice == 2)
            System.out.println("------------\n2.계좌목록\n------------");
        else if (choice == 3)
            System.out.println("------------\n3.예금\n------------");
        else if (choice == 4)
            System.out.println("------------\n4.출금\n------------");
        else if (choice == 5)
            System.out.println("프로그램 종료");

        else {
            System.out.println("번호를 잘못 입력하셨습니다.");
        }
    }

    public String toString() {
        return ano + "\t" + owner + "\t" + balance;
    }

    public void createAccount() {
        System.out.print("계좌번호: ");
        ano = scan.next();
        System.out.print("\n계좌주: ");
        owner = scan.next();
        System.out.print("\n초기입금액: ");
        balance = scan.nextInt();


        accountList[accountIndex] = new Account(ano, owner, balance);
        accountIndex++;
        System.out.println("결과: 계좌가 생성되었습니다.");
    }

    public void accountList() {
        for (int i = 0; i < accountIndex; i++) {
            System.out.println(accountList[i]);
        }
    }

    public void deposit() {
        System.out.print("계좌번호: ");
        String anoValue = scan.next();
        System.out.print("예금액: ");
        int depositValue = scan.nextInt();
        for (int i = 0; i < accountIndex; i++) {
            if (accountList[i].getAno().equals(anoValue)) {
                accountList[i].setBalance(accountList[i].getBalance() + depositValue);
            }
        }
        System.out.println("결과: 예금이 성공되었습니다.");
    }

    public void withdraw() {
        System.out.print("계좌번호: ");
        String anoValue = scan.next();
        System.out.print("출금액: ");
        int withdrawValue = scan.nextInt();
        for (int i = 0; i < accountIndex; i++) {
            if (accountList[i].getAno().equals(anoValue)) {
                accountList[i].setBalance(accountList[i].getBalance() - withdrawValue);
            }
        }
        System.out.println("결과: 출금이 성공되었습니다.");

    }
}

public class BankApplication {
    public static void main(String[] args) {
        int choice;
        Scanner scan = new Scanner(System.in);
        Account account = new Account();

        do {
            System.out.println("--------------------------------------");
            System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
            System.out.println("--------------------------------------");
            System.out.print("선택> ");
            choice = scan.nextInt();
            account.manual(choice);
            switch (choice) {
                case 1:
                    account.createAccount();
                    break;
                case 2:
                    account.accountList();
                    break;
                case 3:
                    account.deposit();
                    break;
                case 4:
                    account.withdraw();
                    break;

            }
        }while(choice != 5);
    }
}
