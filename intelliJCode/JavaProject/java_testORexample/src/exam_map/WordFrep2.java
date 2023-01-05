package exam_map;

import java.util.HashMap;
import java.util.Map;

public class WordFrep2 {
    public static void main(String[] args) {
        String[] sample = {"to", "be", "or", "not", "to", "be", "is", "a", "problem"};
        Map<String, Integer> hashmap = new HashMap<>();
        for (int i = 0; i < sample.length; i++) {
            if (hashmap.get(sample[i]) == null) {
                hashmap.put(sample[i], 1);
            }else{
                Integer value = hashmap.get(sample[i]);
                value++;
                hashmap.put(sample[i], value);
            }
        }
        System.out.println("총 단어 수: " + hashmap.size());
        System.out.println("중복되지 않은 단어: " + hashmap.toString());

    }
}
