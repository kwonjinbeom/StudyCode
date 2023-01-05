package exam_check_synchronized;

public class MyAccount {
    //계좌 소유자
    private String owner;
    //계좌 보유 금액
    private int money;

    public MyAccount(String owner, int money) {
        this.owner = owner;
        this.money = money;
    }

    //예금
    public synchronized void deposit(int amount, String user){
        if(amount > 0){
            money += amount;
            System.out.println("[" + user + "] 임금 : " + amount);
        }else{
            System.out.println("임금액이 올바르지 않습니다.");
        }
        System.out.println("[" + user + "] 님이 요청한 계좌의 잔액 : " + money);
    }

    //출금
    public synchronized void withdraw(int amount, String user){
        if(money - amount > 0){
            money -= amount;
            System.out.println("[" + user + "] 출금 : " + amount);
        }else{
            System.out.println("금액이 부족합니다.");
        }
        System.out.println("[" + user + "] 님이 요청한 계좌의 잔액 : " + money);
    }
    public String getOwner(){
        return owner;
    }
}
