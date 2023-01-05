package TryCatch220928.추상인터페이스차이;

public abstract class Human extends Creature implements Talkable {
    public Human(int x, int y, int age){
        super(x,y,age);
    }
    @Override
    public void attack(){
        System.out.println("도구를 사용!!");
    }
    @Override
    public void talk(){
        System.out.println("사람은 말을 할 수 있다.");
    }
    //동물과 다르게 말을 할 수 있기 때문에 Talkable 인터페이스 구현
}
