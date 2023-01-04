package exam_generic_type;

import exam_none_generic_type.Apple;

public class BoxExample {
    public static void main(String[] args) {
        Box<String> box1 = new Box<>();
        //box1.set(new String("hello"));
        box1.set("hello");
        String str = box1.get();
        System.out.println(str);

        //정수 자료형으로 설정후 6 을 대입
        //Box<int> box2 = new Box<int()
        Box<Integer> box2 = new Box<Integer>();
        //box2.set(Integer.valueOf(6)); 기초형 > 참조형 : 박싱
        box2.set(6);//오토박싱
        //int value = box2.get().intValue(); 참조형 > 기초형 : 언박싱
        int value = box2.get();
        System.out.println(value);

        //생성한 App;e 클래스를 설정 후 청색사과를 대입
        Box<Apple> box3 = new Box<Apple>();
        box3.set(new Apple("청색"));
        Apple app = box3.get();
        System.out.println(app.toString());

        //Box<double> box4 = new Box<double>();
        Box<Double> box4 = new Box<Double>();
        //box4.set(Double.valueOf(3.6);
        box4.set(3.6);
        //double data = box4.get().doubleValue();
        double data = box4.get();
        System.out.println(data);

        Box<Integer> box5 = new Box<Integer>();
        box5.set(5);
        //box5.set(5.7);
        System.out.println(box5.get());
    }
}
