package exam_collection_set;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class setTest {
    public static void main(String[] args) {
        Set<String> s1 = new HashSet<>();
        Set<String> s2 = new HashSet<>();

        s1.add("A");
        s1.add("B");
        s1.add("C");

        s2.add("A");
        s2.add("D");

        Iterator<String> it = s1.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }

        Set<String> union = new HashSet<String>(s1);
        union.addAll(s2);

        Set<String> intersection = new HashSet<>(s1);
        intersection.retainAll(s2);

        Set<String> difference = new HashSet<>(s1);
        difference.removeAll(s2);

        System.out.println("합집합 " + union.toString());
        System.out.println("교집합 " + intersection.toString());
        System.out.println("차집합 " + difference.toString());
    }
}
