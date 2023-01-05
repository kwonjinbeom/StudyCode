package exam_collection_list;

import java.util.ArrayList;
import java.util.Iterator;

public class IteratorTest {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();
        list.add("하나");
        list.add("둘");
        list.add("셋");
        list.add("넷");

        String str;
        Iterator<String> it = list.iterator();
        while(it.hasNext()){
            str = it.next();
            System.out.println(str);
        }
    }
}
