package exam_none_generic_type;

public class BoxExample {
    public static void main(String[] args) {
        Box box = new Box();

        box.set("홍길동");
        // box.set(new String("홍길동"));
        String name = (String) box.get();
        System.out.println("name = " + name);

        //Box에 정수형의 값(5) 대입 - 1
        // Integer iNum = Integer.valueOf(5); // 박싱
        //box.set(iNum);
        box.set(Integer.valueOf(5));
        Integer i = (Integer) box.get();
        System.out.println("i = " + i.intValue()); // 언박싱

        // Box에 정수형의 값(5) 대입 - 2
        box.set(5);//오르박싱(기초형 > 참조형)
        int iValue = (Integer) box.get();//오토언박싱(참조형>기초형)
        System.out.println("iValue = " + iValue);

        // Box에 실수형의 값(8.4) 대입 - 1
        Double dNum = Double.valueOf(8.4);
        box.set(dNum);
        Double d = (Double) box.get();
        System.out.println("d = " + d.doubleValue());

        // Box에 실수형의 값(8.4) 대입 - 2
        // box.set(Double.valueOf(8.4));
        box.set(8.4);
        double dValue = (Double)box.get();
        System.out.println("dValue = " + dValue);

        Character ch = Character.valueOf('잠');
        box.set(ch);
        Character c = (Character) box.get();
        System.out.println(c.charValue());

        box.set('잠');
        char cValue = (Character)box.get();
        System.out.println(cValue);

//        //color를 필드로 갖는 Apple 클래스를 생성하여
//        //box 클래스에 설정하여 보자.
//        //Apple a = new Apple("빨간색");
//        //box.set(a);
//        box.set(new Apple("빨간색"));
//        Apple apple = (Apple) box.get();
//        System.out.println(apple.toString());

//        String str = "java";
//        box.set(str);
//        System.out.println("값: " + (Integer) box.get());
    }
}
