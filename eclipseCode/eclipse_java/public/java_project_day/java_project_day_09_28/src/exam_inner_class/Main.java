package exam_inner_class;

class A {
    private int num;
    static int number;

    A() {
        System.out.println("A 객체가 생성됨");
    }

    class B {
        int field1;
        static int value;

        B() {
            num = 5;
            number = 3;
            System.out.println("B객체가 생성됨");
        }

        void method1() {
            System.out.println("num: " + num);
            System.out.println("number: " + number);
            System.out.println("field1: " + field1);
            System.out.println("value: " + value);
        }

    }
    static class C{
        int field1;
        static int field2;
        C(){
//            num = 10; //정적 멤버 클래스는 외부 클래스의 일반 인스턴스 멤버를 가질 수 없다.
            number = 9;// 정적 인스턴스 멤버는 가능
            System.out.println("C 객체가 생성됨");
        }
        void method1 (){
            System.out.println("field1: " + field1);
        }
        static void method2 (){
            System.out.println("field2: " + field2);
        }
    }
    void method(){
        class D{
            int field3;
            D(){
                System.out.println("D 객체가 생성됨");
            }
            void method1(){
                System.out.println("field3: " + field3);
            }
        }
        D d = new D();
        d.field3 = 3;
        d.method1();
    }
}

public class Main {
    public static void main(String[] args) {
//        A a = new A();
//
//        A.B b = a.new B();
//        b.field1 = 3;
//        b.method1();
//        System.out.println();
//
//        A.C c = new A.C();
//        c.field1 = 3;
//        c.method1();
////        c.method2();
//
//        A.C.field2 = 3;
//        A.C.method2();
//        System.out.println();
//
//        a.method();
        A a = new A();// 외부클래스 a의 객체 생성
        A.B b = a.new B(); // 객체 a에 메모리 할당을 해서 a.new 인가 봄.
        b.field1 = 1;
        b.value = 3; //버전 변경으로 인스턴스 멤버 클래스가 정적 멤버필드를 가질 수 있게됨. 원랜 안됨.
        b.method1();
        A.C c = new A.C(); // c는 정적 클래스이기 때문에 위 경우처럼 a에 공간을
        //할당하지 않고 새롭게 c 자체에다가 저장하나 봄.
        c.field1 = 2;
        c.field2 = 3;
//        A.C.field1 = 4; 객체 생성없이 호출 가능한 건 Static 변수만 가능
        A.C.field2 = 5;
        c.method1();
        c.method2();
//        A.C.method1(); 위의 field1과 같이 메서드도 똑같이 static 만 가능.
        A.C.method2();


    }
}
