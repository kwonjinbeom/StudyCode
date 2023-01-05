package TryCatch220928.추상인터페이스차이;

public interface Flyable {
    void fly(int yDistance);
    void flyMove(int xDistance, int yDistance);
    default void a(){
        System.out.println("defalut a");
    };
    static void b(){
        System.out.println("static b");
    };
    private void c(){
        System.out.println("private c");
    }
}
abstract class D{
    abstract void dd();
    static void b(){};
    private void d(){};
    void f (){};
}
class A extends D implements Flyable {
    public static void main(String[] args) {
        A a = new A();
        a.a();
        Flyable.b();
        a.dd();
//        a.c();
    }
//    @Override
//    public void a(){
//        System.out.println("s");
//        System.out.println("dd");
//    }
    @Override
    public void fly(int yDistance) {

    }

    @Override
    public void flyMove(int xDistance, int yDistance) {

    }
    @Override
    public void dd(){
        System.out.println("ddd");
    };


}
