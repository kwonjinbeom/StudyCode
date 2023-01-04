package inherit.test;

public class Page_54_1_OverloadingSample {
    public void out(){
        System.out.println("out() 메소드 실행!");
    }
    public void out (int num){ //메소드 이름은 같고 매개변수가 달라서 오버로딩이 성립된다고 함.
        System.out.println("out(" + num + ") 메소드 실행!");
    }
}
