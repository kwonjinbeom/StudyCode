package TryCatch220928.추상인터페이스차이;

public class Turtle extends Animal implements Swimable{
    public Turtle(int x, int y, int age){
        super(x, y, age);
    }
    @Override
    public void swimDown(int yDistance){
        setY(getY() - yDistance);
    }
    @Override
    public void printInfo(){
        System.out.println("Turtle - >" + toString());
    }
}
