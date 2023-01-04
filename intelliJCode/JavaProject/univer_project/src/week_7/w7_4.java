package week_7;

import java.util.Arrays;
import java.util.Comparator;

public class w7_4 {
    public static void main(String[] args) {
        String[] array = {"kim", "park", "oh", "lim", "pang", "seo", "lee",
                "yang", "bae", "back"};
        System.out.print("정렬 전: ");
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]+" ");
        }
        System.out.println();
        System.out.print("정렬 후: ");
        Arrays.sort(array, Comparator.reverseOrder());
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]+" ");
        }
        // 예시 답안에는 정렬 후에 내림차순이 아닌 @@오름차순@@으로 예시를 보임. 하지만
        // 질문 조건인 내림차순으로 정렬하였음.
    }
}
