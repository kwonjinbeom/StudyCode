package _8_Collection;

import java.util.*;

public class CustomerManager {
    public static void main(String[] args) {
        boolean k = true;
        Scanner scan = new Scanner(System.in);
        Map<String, Integer> hashmap = new LinkedHashMap<>();
        //예시대로 순서가 보장되기 위해서는 hashmap이 아닌 linkedhashmap을 사용해야함.
        System.out.println("** 포인트 관리 프로그램입니다 **");
        while(true){
            System.out.print("이름");
            String name = scan.next();
            if(name.equals("종료"))
                break;
            System.out.print("포인트");
            int point = scan.nextInt();
            if(hashmap.isEmpty()){
                hashmap.put(name,point);
            }
            for (String key : hashmap.keySet()){
                if(name.equals(key)){
                    hashmap.put(name,hashmap.get(key)+point);
                    k = false;
                }
            }
            if(k==true)
            hashmap.put(name,point);

            k = true;
            System.out.println(hashmap.toString());
        }
    }
}
