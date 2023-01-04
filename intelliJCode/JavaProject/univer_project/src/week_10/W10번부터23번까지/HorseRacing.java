package week_10.W10번부터23번까지;

public class HorseRacing {
    public static void main(String[] args) {
        Horse tony = new Horse();
        Zebra jeni = new Zebra();

        tony.run();
        jeni.run();
        // 각 Horse와 Zebra에서 재정의한 run()메서드 값이 출력된다.
    }
}
