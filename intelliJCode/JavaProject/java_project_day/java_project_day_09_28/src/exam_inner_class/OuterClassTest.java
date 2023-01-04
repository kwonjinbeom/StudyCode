package exam_inner_class;

class OuterClass{
//    public String aaa;
    private String famous;
    public OuterClass(){
        famous = "할 수 있다는 믿음을 가지먄 처음에는 그런 능력이 없을지라도 "
                + "결국에는 할 수 있는 능력을 확실하게 갖게 된다.- 간디";
    }
//    public void outerMethod(){
//        InnerClass inner = new InnerClass();
//        inner.innerMethod();
//    }
//    static class InnerClass{
    class InnerClass{
        private String wise;
        public InnerClass(){
            wise = "성공이라는 못을 박으려면 끈질김이라는 망치가 필요하다.-존 메이슨";
        }
        public void innerMethod(){
            System.out.println("1. " + wise);
//            System.out.println("2. " + famous);//static 내부클래스는 외부 일반
            //클래스를 참조할 수 없다. 의 예시
//            System.out.println(aaa);//public 으로 선언하여도 마찬가지
        }
    }
}
public class OuterClassTest {
    public static void main(String[] args) {
        OuterClass outer = new OuterClass();

        OuterClass.InnerClass inner = outer.new InnerClass();
//        OuterClass.InnerClass inner = new OuterClass.InnerClass();
        inner.innerMethod();

//        OuterClass outer = new OuterClass();
//        outer.outerMethod();
    }
}
