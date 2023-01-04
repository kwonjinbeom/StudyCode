package exam_collection_list;

import java.util.Iterator;
import java.util.LinkedList;

public class LinkedListTest {
    public static void main(String[] args) {
        LinkedList<String> list = new LinkedList<String>();
        list.add("Galaxy S22");
        list.add("iPhone 13");

        System.out.println(list.toString());
        System.out.println();

        Iterator<String> it = list.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }

    }
}
