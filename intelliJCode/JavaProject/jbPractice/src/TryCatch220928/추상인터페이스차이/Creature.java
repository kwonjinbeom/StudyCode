package TryCatch220928.추상인터페이스차이;

public abstract class Creature {
    private int x;
    private int y;
    private int age;

    public Creature(int x, int y, int age){
        this.x = x;
        this.y = y;
        this.age = age;
    }
    public void age(){
        age++;
    }
    public void move(int xDistance){
        x += xDistance;
    }
//move 와 age는 모든 생명체에게 해당되는 사항이기때문에 일반 메서드로 사용
    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }
    public abstract void attack();

    public abstract void printInfo();
    // attack 과 printInfo는 모든 생명체에 필요하긴 하지만 각각 생명체에
    // 따라 다르게 구현되기 떄문에 추상메서드로 선언
    @Override
    public String toString(){
        return "x : " + x + ",y : " + y + ", age : " + age;
    }
}
// 만든 순서 Creature(추상) > Animal(추상) > Human(추상)
// > Talkable(인터페이스) > Flyable(인터페이스) > Pigeon(클래스)
// > Swimable(인터페이스) > Turtle(클래스) > Kevin(클래스)
// > Programmer(인터페이스) > Main(실행 클래스)
