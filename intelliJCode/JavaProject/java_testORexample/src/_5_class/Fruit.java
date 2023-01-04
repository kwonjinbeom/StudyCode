package _5_class;

public class Fruit {
    public String fname;
    public int price;
    Fruit(){}
    Fruit(String fname, int price){
        this.fname = fname;
        this.price = price;
    }


    public int getPrice() {
        return price;
    }

    public String getFname() {
        return fname;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }


    public void printFruit(){
        System.out.println(fname + " : " + price);
    }
    public int sum(int a){
        int sum =+ a;
        return sum;
    }

    public void discount(int a){
        System.out.println("총금액 : " + a + "원");
        int discount =  (int)(a - (a * (0.15))) ;
        System.out.printf("할인 후 결제 금액 : %d원",  discount);
    }
}
