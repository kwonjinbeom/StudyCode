package use_of_programming_languages;

public class page_21_2 {
    public static void main(String[] args) {
        int x = 12;
        int y = 12;

        int result1 = ++x + 10;
        int result2 = y++ + 10;

        System.out.println("x:" + x + ",result1 = " + result1);
        System.out.println("y:" + y + ",result1 = " + result2);
        System.out.println("y:" + y);
//9번째 줄에서 y에 1의 값이 이미 더해져서 12번째 줄에 y값이 이미 13인 상태 강사님께서는 책이 잘못된다하심.
    }
}
