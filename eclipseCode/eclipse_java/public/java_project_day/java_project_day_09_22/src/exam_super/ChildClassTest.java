package exam_super;

class ParentClass{
    protected int data;
    public ParentClass(){data=100;}
    public void print(){
        System.out.println("수퍼 클래스의 print()매서드");
    }
}
class ChildClass extends ParentClass{
    protected int data;

    public ChildClass(){data=200;}
    @Override
    public void print(){
        super.print();
        System.out.println("서브 클래스의 print()메서드 ");
        System.out.println("data : " + data);
        System.out.println("this.data : " + this.data);
        System.out.println("super.data : " + super.data);
    }
}
public class ChildClassTest {
    public static void main(String[] args) {
        ChildClass obj = new ChildClass();
        obj.print();
    }
}
