package exam_collection_list;

import java.util.ArrayList;
import java.util.Iterator;

public class IteratorTest02 {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();
        list.add("서울");
        list.add("북경");
        list.add("상해");
        list.add("서울");
        list.add("도쿄");
        list.add("뉴욕");

        //ArrayList의 원소를 인덱스로 접근하고자 할 때
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
        System.out.println("=================");

        //Iterator는 커서를 통해서 모든 원소의 순차적 접근하고자 할 때
        //ArrayList의 iterator()메서드는 Iterator 인터페이스로 구현된 구현 클래스(Itr)의
        //주솟값(new Itr())을 반환
        //인터페이스명<타입 인자> 참조변수 = list.iterator();
        Iterator<String> iter = list.iterator();
        while(iter.hasNext()){
            System.out.println(iter.next());
        }
    }
}
