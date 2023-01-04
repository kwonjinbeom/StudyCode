package exam_collection_set;

import java.util.*;

public class SetInterfaceTest {
    public static void main(String[] args) {
        HashSet<String> set = new HashSet<>();
//        LinkedHashSet<String> set = new LinkedHashSet<>();
//        TreeSet<String> set = new TreeSet<>();
        set.add("Milk");
        set.add("Bread");
        set.add("Butter");
        set.add("Cheese");
        set.add("Ham");
        set.add("Ham");
        //중복은 안되고 순서도 없고
        System.out.println(set.toString());

        //반복자
//        Iterator<String> it = set.iterator();
//        while(it.hasNext()){
//            System.out.println(it.next());
//    }
       HashSet<Integer> set1 = new HashSet<>();
       set1.add(Integer.valueOf(3));
       set1.add(5);
       set1.add(3);
       set1.add(4);

        System.out.println(set1.toString());
        }
    }
