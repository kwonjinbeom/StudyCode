package 제너릭클래스221007;

class GenericPractice<T>{
    private T t;
    GenericPractice(){}
    GenericPractice(T t){
        this.t = t;
    }

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    <T> T genericMethod(T a){
        return a;
    }
    static <T> T genericStaticMethod(T a){
        return a;
    }
}
public class Main {
    public static void main(String[] args) {
        GenericPractice<String> g1 = new GenericPractice<String>("홍길동");
        String g1_String = g1.getT();

        GenericPractice<Integer> g2 = new GenericPractice<>();
        g2.setT(900);
        int g2_int = g2.getT();

        System.out.println("g1 = " + g1_String);
        System.out.println("g2 = " + g2_int);

        System.out.println(GenericPractice.genericStaticMethod(500));
        System.out.println(g1.genericMethod("문자열"));
        System.out.println(g1.genericMethod('F'));

    }
}
