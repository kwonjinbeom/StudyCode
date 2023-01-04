package ArrayList220928;

import java.util.ArrayList;

public class ArrayListTest {
    public static void main(String[] args) {
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add("black");
        arrayList.add("white");
        arrayList.add("white");
        arrayList.set(2,"Blue");
        System.out.println(arrayList);
        System.out.println(arrayList.get(0));
        for (int i = 0; i < arrayList.size(); i++) {
            System.out.print(arrayList.get(i) + " ");
        }
    }
}
