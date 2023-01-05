package exam_api_stirngtokenizer.exam01_method;

import java.util.StringTokenizer;

public class StringSplitExample {
    public static void main(String[] args) {
        //방법1: String 클래스의 split()메서드
        String text = "자바&오라클,,리눅스,HTML-JAVASCRIPT-JQUERY";
        String[] names = text.split(",");
//    String[] names = text.split("&|,|-");
        // 구분자가 연속으로 존재 시 빈문자열로 간주하여 빈문자열 반환

        System.out.println("배열의 수 : " + names.length);

        for (String name : names)
            System.out.println(name);
        System.out.println();

        //방법2: 남아 있는 토큰을 확인하고 while문으로 반복
        //StringTokenizer(대상 문자열, 구분자) 생성자
        StringTokenizer st = new StringTokenizer(text,",");
        //StringTokenizer st = new StringTokenizer(text, "&,-");
        int countTokens = st.countTokens();
        System.out.println("전체 토큰 수 : " + countTokens);

        while(st.hasMoreTokens()){
            String token = st.nextToken();
            System.out.println(token);
        }
    }


}
