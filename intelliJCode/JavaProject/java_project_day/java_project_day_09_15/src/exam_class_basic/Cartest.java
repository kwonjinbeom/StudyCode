package exam_class_basic;

public class Cartest {
    public static void main(String[] args) {
        Car myCar = new Car();

//        myCar.speed = 0;
//        myCar.geer = 1;
//        myCar.color = "red";

        myCar.carData(70,9,"red"); //메서드를 이용하여 간략하게 단축

        myCar.speedUp(20);
        myCar.printData();
        System.out.println(myCar.toString());
        System.out.println();

        Car yourCar = new Car();

        yourCar.geer = 3;
        yourCar.speed = 60;
        yourCar.color = "blue";

        //youtCar.carData(60, 3, "blue");

        yourCar.speedDown(10);
        yourCar.printData();
        System.out.println(yourCar.toString());
    }
}
