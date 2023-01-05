package _8_Collection;

import java.util.*;

public class HashToArrayList {
    static Map<String,Integer> hashmap = new HashMap<>();
    public static void main(String[] args) {

        hashmap.put("범죄",112);
        hashmap.put("화재",119);
        hashmap.put("전화번호",114);
        Iterator<Integer> iter = toArrayList().iterator();
        while (iter.hasNext()){
            System.out.println(iter.next());
        }
    }
    static List toArrayList(){
        List<Integer> arrayList = new ArrayList<>();
        for (String key : hashmap.keySet()){
            arrayList.add(hashmap.get(key));
        }
        return arrayList;
    }

}
