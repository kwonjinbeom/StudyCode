package firstExam;

public class LogicalOperator {
    public static void main(String[] args) {
        int x = 3;
        int y = 4;
        System.out.println((x == 3) && (y == 7));
        System.out.println((x == 3) || (y == 4));

        boolean result = (++x == 3) && (y++ == 7); // 앞에가 거짓이면 뒤에가 실행이 안된다.

        System.out.println("x = " + x + ", y = " + y);
        System.out.println("result = " + result);

        result = (x++ == 4) || (++ y ==7); // 여긴 이미 논리합에서 앞이 참으로 연산이 되었고
        // 더이상 결과를 볼 필요가 없어서 뒤에 수식이 나오지않는다.

        System.out.println("x = " + x + ", y = " + y);
        System.out.println("result = " + result);
    }
}
// 결과적으로 논리던 참이던 뒤에 결과가 예측이 된다면 값이 뒤에 코드가 실행되지 않고 그전에 끝난다.
