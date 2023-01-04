package exam_collections;

public class Fruit implements Comparable<Fruit>{
    private String name;
    private int price;

    public Fruit(String name, int price) {
        this.name = name;
        this.price = price;
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

    @Override
    public int compareTo(Fruit o){
        if(price<o.price) return -1;
        else if(price == o.price) return 0;
        else return 1;
    }
//generate로 만든 toString()
//    @Override
//    public String toString() {
//        return "Fruit{" +
//                "name='" + name + '\'' +
//                ", price=" + price +
//                '}';
//    }
    @Override
    public String toString(){
        return name;
    }
}
