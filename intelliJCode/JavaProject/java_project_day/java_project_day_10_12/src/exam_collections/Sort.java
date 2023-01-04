package exam_collections;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Sort {
    public static void main(String[] args) {
        String[] sample = { "i", "walk","the", "line", "apple"};
        List<String> list = Arrays.asList(sample);

        Collections.sort(list);//유니코드순이여서 abcd 순서인 듯
        System.out.println("오름차순 : " + list.toString());

        Collections.sort(list, Collections.reverseOrder());
        System.out.println("내림차순 : " + list.toString());
    }
}
