package _6_Inheritance;

class Car{
    private String color;
    private int account;

    public Car(String color, int account){
        this.color = color;
        this.account = account;
    }

    public String getColor() {
        return color;
    }

    public int getAccount() {
        return account;
    }

    public String toString(){
        return "[색상] "+color +"\t[생산수량] "+ account;
    }
}
class Monata extends Car{
    private String series;
    private String use;

    public Monata(String color, int account, String use, String series){
        super(color, account);
        this.series = series;
        this.use = use;
    }
    public String toString(){
        return super.toString() + "\t[용도] "+ use + "\t[시리즈] "+ series;
    }
}

public class CarMain {
    public static void main(String[] args) {
        Monata[] m = {
                new Monata("흰색", 5000, "승용", "NF"),
                new Monata("은색", 7000, "업무", "Brilliant"),
                new Monata("감홍색", 4000, "택시", "EF"),
                new Monata("검정색", 6000, "승용", "Hybrid")
                };
        for (Monata i: m){
            System.out.println(i);
        }
    }
}
