package exam_class_basic;

public class Car_jb {
    public int speed ;
    public int geer;
    public String color;

    public void speedUp(int s){
        speed += s;
    }

    public void speedDown(int s){
        speed -= s;
    }
    public void geerControl(int geerUpDown){
        if(geerUpDown > 0){
            geer += geerUpDown;
        }else if(geerUpDown < 0){
            geer += geerUpDown;
        }
    }

    public void printData(){
        System.out.println("속도: "+ speed + " 기어: " + geer + " 색상: " + color);
    }

    public String toString(){
        return "속도: " + speed + "km 기어: " + geer + "단 색상: " + color + " color";
    }
}
