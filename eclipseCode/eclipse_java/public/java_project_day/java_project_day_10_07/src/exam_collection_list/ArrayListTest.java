package exam_collection_list;

import java.util.ArrayList;

public class ArrayListTest {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();

        list.add("Java");
        list.add("Java");
        list.add("JSP");
        list.add("SPRING");

        int size = list.size();
        System.out.println("총 객체 수:"+ size);
        System.out.println();

        list.add(1,"ORACLE");
        list.set(2,"Client programing");
        list.remove(3);

        int index = list.indexOf("ORACLE");
        System.out.println(index);

        index = list.lastIndexOf("ORACLE");
        System.out.println(index);

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
        System.out.println();

        ArrayList<Integer> list1 = new ArrayList<Integer>();
        list1.add(23);
        list1.add(Integer.valueOf(94));
        list1.add(Integer.valueOf(62));
        list1.add(Integer.valueOf(45));

        System.out.println(list1.toString());

        list1.add(2, Integer.valueOf(78));
        System.out.println(list1.toString());
        System.out.println();
    }
}
