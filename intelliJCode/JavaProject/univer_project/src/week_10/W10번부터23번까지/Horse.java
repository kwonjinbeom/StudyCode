package week_10.W10번부터23번까지;

public class Horse extends Animal {
    //속성
    public int numOfLeg;
    public String power;
    public String color;
    public int speed;

    //기본 생성자
    Horse(){}
    //파라미터를 통해 속성을 초기화하는 생성자
    Horse(int numOfLeg, String power, String color, int speed){
        this.numOfLeg = numOfLeg;
        this.power = power;
        this.color = color;
        this.speed = speed;
    }

    @Override
    public void run(){
        System.out.println(toString());
    }

    @Override
    public String toString() {
        return "numOfLeg=" + numOfLeg + ", power='" + power + '\'' + ", color='" + color + '\'' + ", speed=" + speed;
    }


    public static void main(String[] args) {
        Horse horse = new Horse(4,"Strong","brown",6);
        horse.run();

        Horse horse1 = new Horse();
        horse1.run();
    }
}
