package TryCatch220928.추상인터페이스차이;

public abstract class Animal extends Creature{
    public Animal(int x, int y, int age){
        super(x,y,age);
    }
    @Override
    public void attack(){
        System.out.println("몸을 사용하여 공격!!");
    }
    //Creature에 추상 메서드 오버라이딩
}
