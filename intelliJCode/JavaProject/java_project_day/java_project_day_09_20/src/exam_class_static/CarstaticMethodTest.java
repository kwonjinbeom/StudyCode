package exam_class_static;

public class CarstaticMethodTest {
    public static void main(String[] args) {
        CarStaticMethod c1 = new CarStaticMethod(90, 1, "blue");
        CarStaticMethod c2 = new CarStaticMethod(50, 0, "white");

        System.out.println(c1.toString());
        System.out.println(c2.toString());

        int number = CarStaticMethod.getNunberOfCars();
        System.out.println("지금까지 생성된 자동차 수 = " + number);

    }
}
