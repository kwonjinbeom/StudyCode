package exam_collection_set;

import java.util.HashSet;
import java.util.Set;

public class FindDupplication {
    public static void main(String[] args) {
        String[] sample = {"단어", "의미", "구절", "의미", "단락"};
        Set<String> hashset = new HashSet<>();

        for (int i = 0; i < sample.length; i++) {
            if(!hashset.add(sample[i]))
                System.out.println("중복된 단어: " + sample[i]);;
        }
        System.out.println("단어 수: " + hashset.size());
        System.out.println("중복되지 않은 단어: " + hashset.toString());
        //set은 중복을 허용하지 않기 때문에 12번째 줄에서 중복 시 false 출력을 이용
    }
}
