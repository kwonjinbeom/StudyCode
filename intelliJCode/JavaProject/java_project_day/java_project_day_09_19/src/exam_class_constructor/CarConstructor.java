package exam_class_constructor;

public class CarConstructor {
    private int speed;
    private int gear;
    private String color;

    public CarConstructor(){
        this(0,1,"red");
    }
    public CarConstructor(int speed, int gear, String color){
        this.speed = speed;
        this.gear = gear;
        this.color = color;
    }

    public int getGear() {
        return gear;
    }

    public int getSpeed() {
        return speed;
    }

    public String getColor() {
        return color;
    }
    public String toString(){
        return "자동차 정보 [속도=" + speed + ", 기어 =" + gear + ", 색상=" + color + "]";
    }
}
