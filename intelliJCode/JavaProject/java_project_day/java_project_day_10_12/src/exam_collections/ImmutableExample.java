package exam_collections;

import java.util.*;

public class ImmutableExample {
    public static void main(String[] args) {
        //List 불변 컬렉션 생성
        List<String> immutableList1 = List.of("Java", "C", "C#");
//        immutableList1.add("C++");//결과는?
        System.out.println(immutableList1);

        //Set 불변 컬렉션 생성
        Set<String> immutableSet1 = Set.of("A", "B", "C");
//        immutableSet1.remove("A"); //결과는?
        //위에 주석 처리한 둘다 에러 불변이여서 변경 X
        System.out.println(immutableSet1);

        //Map 불변 컬렉션 생성
        Map<Integer, String> immutableMap1 = Map.of(
                1, "A",
                2, "B",
                3, "C"
        );
//        immutableMap1.put(4, "D"); //결과는?
        //얘도 마찬가지
        System.out.println(immutableMap1);

        //List 컬렉션을 불변 컬렉션으로 복사
        List<String> list = new ArrayList<>();
        list.add("A");
        list.add("B");
        list.add("C");
        List<String> immutableList2 = List.copyOf(list);
        System.out.println(immutableList2);

        //Set 컬렉션을 불변 컬렉션으로 복사
        Set<String> set= new HashSet< >();
        set.add("A");
        set.add("B");
        set.add("C");
        Set<String> immutableSet2 = Set.copyOf(set);
        System.out.println(immutableSet2);

        //Map 컬렉션을 불변 컬렉션으로 복사
        Map<Integer, String> map = new HashMap<>();
        map.put(1, "A");
        map.put(2, "B");
        map.put(3, "C");
        Map<Integer, String> immutableMap2 = Map.copyOf(map);
        System.out.println(immutableMap2);

        //set이랑 map은 순서가 없어서 계속 출력할 때 마다 결과가 다르게 출력된다.

        //배열로부터 List 불변 컬렉션 생성
        String[] array = { "A", "B", "C" };
        List<String> immutableList3 = Arrays.asList(array);
        System.out.println(immutableList3);
    }
}
