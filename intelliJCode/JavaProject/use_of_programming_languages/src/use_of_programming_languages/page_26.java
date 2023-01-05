package use_of_programming_languages;

public class page_26 {
    public static void main(String[] args) {
        int value = 123;
        String result = (value % 2 == 0)?"짝수":"홀수";
        System.out.println(value + "는 " + result+ "이다.");
        //true일 경우 왼쪽 false일 경우 오른쪽 값을 반환한다.
    }
}
