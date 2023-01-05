package exam_collection_set;

import java.util.HashSet;
import java.util.Set;

public class HashSetExample03 {
    public static void main(String[] args) {
        Set<Member> set = new HashSet<>();
        set.add(new Member("홍길동", 50));
        set.add(new Member("홍길동", 50));
        set.add(new Member("김철수", 36));

        System.out.println("총 객체수 : " + set.size());
        System.out.println("\t" + set.toString());
    }
}
