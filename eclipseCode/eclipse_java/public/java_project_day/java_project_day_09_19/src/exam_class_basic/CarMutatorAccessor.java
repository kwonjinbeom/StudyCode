package exam_class_basic;

public class CarMutatorAccessor {
    private int speed;
    private int gear;
    private String color;

    public int getSpeed(){
        return speed;
    }

    public void setSpeed(int s) {
        if(s>0)
            speed = s;
        else
            speed = 0;
    }

    public int getGear() {
        return gear;
    }

    public void setGear(int g) {
        this.gear = g;
    }

    public String getColor() {
        return color;
    }
    public void setColor(String c) {
        color = c;
    }



    public void speedUp(int s){
        speed += s;
    }

    public void speedDown(int s){
        speed -= s;
    }

    public String toString() {
        return "자동차 상태정보 [ 속도: " + speed + " 기어: " + gear + " 색상: " + color + "]";
    }

}
