package getterSetter;

public class Test_Getter_Setter {
    public static void main(String[] args) {
        Class_Getter_Setter introduce = new Class_Getter_Setter();
        //객체 선언
        introduce.name = "권진범";
        //클래스문에서 멤버 필드 제한자를 private로 지정할 시 name의
        //변경이 안된다. 하지만 밑에 setName
        System.out.println(introduce.getName());
        introduce.setName("길동홍");
        //이렇게 setName으로 하면 private여도
        // setName(문법으로 오류상황을 방지할 수 있음)으로 변경할 수 있다.
        System.out.println(introduce.getName());
    }
}
