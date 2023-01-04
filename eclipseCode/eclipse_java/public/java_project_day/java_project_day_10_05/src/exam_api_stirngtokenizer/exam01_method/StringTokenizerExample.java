package exam_api_stirngtokenizer.exam01_method;

import java.util.StringTokenizer;

public class StringTokenizerExample {
    public static void main(String[] args) {
        String text = "홍길동/이수홍,,박연수-김민희,";

        //방법1: 남아 있는 토큰을 확인하고 while문으로 반복
        //StringTokenizer(대상 문자열, 구분자) 생성자
        StringTokenizer st = new StringTokenizer(text,"/,-");
        int countTokens = st.countTokens();
        System.out.println("전체 토큰 수 : " + countTokens);

        while(st.hasMoreTokens()){
            String token = st.nextToken();
            System.out.println(token);
        }
        System.out.println();

        //방법2: 전체 토큰 수를 얻어 for문으로 반복
        st = new StringTokenizer(text, "/,-");
        for (int i = 0; i < countTokens; i++) {
            String token = st.nextToken();
            System.out.println(token);

        }
    }
}
