package inherit.test;

import use_of_programming_languages.Page_50_Point;

public class Page_50_TestPoint {
    public static void main(String[] args) {
        Page_50_Point p1 = new Page_50_Point();
        Page_50_Point p2 = new Page_50_Point(10, 20);

        System.out.println("p1:" + p1.getPosX() + "," + p1.getPosY());
        System.out.println("p2:" + p2.getPosX() + "," + p2.getPosY());

        p1.setPosX(12);
        p1.setPosY(23);
        System.out.println("p1:" + p1.getPosX() + "," + p1.getPosY());
    }
}
