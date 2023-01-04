package _5_class;

public class SmartPhone {
    private String maker;
    private String name;
    private int price;
    private int discountRate;


    public void SmartPhone(){}

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(int discountRate) {
        this.discountRate = discountRate;
    }

    SmartPhone(String maker, String name, int price, int discountRate){
        this.maker = maker;
        this.name = name;
        this.price = price;
        this.discountRate = discountRate;
    }
    public int calculateDiscount(){
        double discountPric = (double)price - ((double)price * (discountRate/100.0));
        int discountPrice = (int)discountPric;
        return discountPrice;
    }

    public void print(int discountPrice){
        if(discountRate==0){
            System.out.printf("---------------------------\n%s [%s]\n가격 : %d\n",maker,name,price);
        }else{
            System.out.printf("---------------------------\n%s [%s]\n가격 : %d\n할인가격(%d%%) :  %d\n",maker,name,price,discountRate,discountPrice);
        }
    }
}
