public class UpCastingTest {
    public static void main(String[] args) {
        Square s =new Square();
        s.name = "정사각형";
        Triangle t = new Triangle();
        t.name = "삼각형";
        Circle c = new Circle();
        c.name = "원";

        Shape[] shapes = {s, t , c};
        for (int i = 0; i < shapes.length; i++) {
            System.out.printf("%d번 인덱스의 도형: %s\n",i ,shapes[i].name);
        }
    }
}
class Shape{
    String name;
}
class Square extends Shape{}
class Triangle extends Shape{}
class Circle extends Shape{}
