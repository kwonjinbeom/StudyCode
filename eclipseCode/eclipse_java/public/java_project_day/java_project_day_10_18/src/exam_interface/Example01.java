package exam_interface;

import java.util.Arrays;
import java.util.List;

public class Example01 {
    public static void main(String[] args) {

        //명령형 스타일
//        List<String> list = Arrays.asList("서울", "북경", "뉴욕", "방콕");
//        boolean result = false;
//        for (String city : list){
//            if(city.equals("서울")){
//                result = true;
//                break;
//            }
//        }
//        System.out.println(result);

        //서술형 스타일
        List<String> list = Arrays.asList("서울", "북경", "뉴욕", "방콕");
        System.out.println(list.contains("서울"));


    }
}
