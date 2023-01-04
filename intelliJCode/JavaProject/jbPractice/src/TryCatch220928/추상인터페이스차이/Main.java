package TryCatch220928.추상인터페이스차이;

public class Main {
    public static void main(String[] args) {
        Pigeon p = new Pigeon(5,10,14);
        p.printInfo();
        p.age();
        p.move(100);
        p.printInfo();
        p.fly(5);
        p.printInfo();
        p.flyMove(10,20);
        p.printInfo();
        p.attack();
        System.out.println();

    }
}
