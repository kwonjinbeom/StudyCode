package TryCatch220928.추상인터페이스차이;

public class Pigeon extends Animal implements Flyable{
    public Pigeon(int x, int y, int age){
        super(x,y,age);
    }
    @Override
    public void fly(int yDistance){
        setY(getY() + yDistance);
    }
    @Override
    public void flyMove(int xDistance, int yDistance){
        setY(getY() + yDistance);
        setX(getX() + xDistance);
    }
    @Override
    public void printInfo(){
        System.out.println("Pigeon - > " + toString());
    }
    // Pigeon은 Animal과 Flyable을 상속 및 인터페이스 구현을 했다.
    // 여기서 fly, flyMove는 Flyable의 인터페이스 기능이고
    // printInfo는 Creature라는 부모(수퍼)클래스의 기능이다.
    // 상속 및 인터페이스 구현을 했을 때는 인터페이스의 기능은 무조건 다
    // 사용해야되고 상속의 기능은 단 한가지 이상 꼭 사용해야 사용가능.

}
