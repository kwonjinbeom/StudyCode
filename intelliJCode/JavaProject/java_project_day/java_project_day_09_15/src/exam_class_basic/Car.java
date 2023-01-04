package exam_class_basic;

public class Car {
    public int speed ;
    public int geer;
    public String color;

    public void carData(int s, int g, String c){
        speed = s;
        geer = g;
        color = c;
    }
    public void speedUp(int s){
        speed += s;
    }

    public void speedDown(int s){
        speed -= s;
    }

    public void printData(){
        System.out.println("속도: "+ speed + " 기어: " + geer + " 색상: " + color);
    }

    public String toString(){
        return "속도: " + speed + "km 기어: " + geer + "단 색상: " + color + " color";
    }
}
