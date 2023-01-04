package exam_map;

import java.util.*;

public class WordFreq {
    public static void main(String[] args) {
        int count = 1;

        String[] sample = {"to", "be", "or", "not", "to", "be", "is", "a", "problem"};
        List<String> arrayList = new ArrayList<>();
        Map<String,Integer> hashmap = new HashMap<>();
        for (int i = 0; i < sample.length; i++) {
            arrayList.add(sample[i]);
            hashmap.put(sample[i], count);
        }
        Set<Map.Entry<String, Integer>> entrySet = hashmap.entrySet();
        Iterator<Map.Entry<String, Integer>> entryIterator = entrySet.iterator();
        for (int j = 0; j < sample.length; j++) {
            for (int k = j+1; k < sample.length; k++) {
                if(arrayList.get(j).equals(arrayList.get(k))){
                    while(entryIterator.hasNext()){
                        Map.Entry<String, Integer> entry = entryIterator.next();
                        if(arrayList.get(j).equals(entry.getKey())){
                            hashmap.put(entry.getKey(),entry.getValue()+1);
                        }
                    }
                    entryIterator = entrySet.iterator();
                }
            }
        }
//18, 19, 20줄까지 list에 sample데이터를 넣어서 중복을 확인한다. 21번째 줄에서 iterator를
//한 번 순회하면서 sample에서 중복이였던 요소의 문자열에 value값을 1추가해줌.
        System.out.println("총 단어 수: " + hashmap.size());
        System.out.println("중복되지 않은 단어: " + hashmap.toString());
        //set은 중복을 허용하지 않기 때문에 12번째 줄에서 중복 시 false 출력을 이용
    }
}
//이거 내가 한건데 좀 개판인거 같음 wordfrep2 사용해야할듯. 2는 형꺼 보고 다시 생각한거