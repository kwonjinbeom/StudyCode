package exam_class_constructor;

public class CarConstructorTest {
    public static void main(String[] args) {
        CarConstructor c1 = new CarConstructor(60, 1, "blue");
        System.out.println(c1.toString());

        CarConstructor c2 = new CarConstructor();
        System.out.println(c2.toString());
    }
}
