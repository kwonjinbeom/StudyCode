package exam_collections;

import java.util.*;

public class SortTest {
    public static void main(String[] args) {
        /* 클래스 : Fruit
         * 필드 :과일명(name), 가격(price)*/

		/* 1. 객체배열을 선언하여 "포도"-3000, "수박"-20000, "딸기"-11900 저장한다.
           1-1. 객체 배열의 값에서 가격순으로 정렬하여 출력한다 (배열 오름차순 정렬) */
        Fruit array[] = {new Fruit("포도", 3000),
        new Fruit("수박" , 20000),
        new Fruit("딸기", 11900)};

        Arrays.sort(array);
        System.out.println(Arrays.toString(array));

        /* 2. 그 값을 리스트 타입으로 변환하여 Collections.sort()를 사용하여 정렬한 후 출력한다.  */
        List<Fruit> list = Arrays.asList(array);

        Collections.sort(list); //오름차순  : [포도, 딸기, 수박]
        System.out.println("오름차순 : " + list.toString());

        Collections.reverse(list);
        System.out.println("내림차순 : " + list.toString());

        Collections.sort(list, Collections.reverseOrder()); //내림차순 : [수박, 딸기, 포도]

        /* 3. TreeSet에 저장하여 출력한다.*/
        TreeSet<Fruit> treeSet = new TreeSet<Fruit>();
        treeSet.add(new Fruit("포도", 3000));
        treeSet.add(new Fruit("수박", 20000));
        treeSet.add(new Fruit("딸기", 11900));
        treeSet.add(new Fruit("딸기", 11900));

        Iterator<Fruit> it = treeSet.iterator();
        while(it.hasNext()) {
            Fruit fruit = it.next();
            System.out.println(fruit.getName() + ":" + fruit.getPrice());
        }
    }
}
