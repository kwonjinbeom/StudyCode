package exam_collection_list;

import java.util.ArrayList;

class Apple{
    private String kind;
    private String color;

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    Apple(){}
    Apple(String kind, String color){
        this.kind = kind;
        this.color = color;
    }
}

public class ArrayListAppleTest {
    public static void main(String[] args) {
        ArrayList<Apple> list2 = new ArrayList<Apple>();
        list2.add(new Apple("부사", "빨강"));
        list2.add(new Apple("아오리", "청색"));
        list2.add(new Apple("썸머킹", "황금"));
        list2.add(new Apple("홍로", "빨간"));


        // 출력 - 1
        for (int i = 0; i < list2.size(); i++) {
            Apple app = list2.get(i);
            System.out.print("품종: " + app.getKind());
            System.out.println(", 색상: " + app.getColor());
//            System.out.println(app.toString());
        }
        System.out.println();

        // 출력 - 2
        for (int i = 0; i < list2.size(); i++) {
//            System.out.print("품종: " + list2.get(i).getKind());
//            System.out.println(", 색상: " + list2.get(i).getColor());
            System.out.println(list2.get(i).toString());
        }
        System.out.println();
        // 출력 - 3 : for ~ each 문으로 출력.
        for (Apple app : list2){
            System.out.println(app.toString());
        }
        System.out.println();

        //printArray(list2);
        System.out.println();
    }
}
