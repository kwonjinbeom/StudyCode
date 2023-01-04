package _5_class;

public class FruitTest {
    public static void main(String[] args) {
        final int fruitNum= 4;
        int sum = 0;
        Fruit f = new Fruit();
        Fruit[] fruit = {
        new Fruit("banana", 4800),
        new Fruit("starawberry" , 21000),
        new Fruit("persimmon", 19000),
        new Fruit("cherry" , 12000)
        };
        System.out.println("=======과일구입 목록===========");
        for (int i = 0; i < fruitNum; i++) {
            fruit[i].printFruit();
        }
        System.out.println("-----------------------------");
        for (int i = 0; i < fruitNum; i++) {
            sum = sum + fruit[i].sum(fruit[i].getPrice());
        }
        f.discount(sum);
    }
}
