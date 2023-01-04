package exam_method_overload;

public class OverloadCalcTest {
    public static void main(String[] args) {


        OverloadCalc over = new OverloadCalc();

        int i = over.plus(3, 5);
        System.out.println("int의 합 : " + i + "\n");

        float j = over.plus(1.5f, 3.2f);
        System.out.println("float의 합 : " + j + "\n");

        double k = over.plus(2.4 , 4.5);
        System.out.println("double의 합 : " + k + "\n");

        int num = over.plus(5,3,8,9,2);
        System.out.println("\n가변 길이 메서드 호출에 의한 합 : " + num);

        int[] values1 = {1, 2, 3};
        int result = over.plusInt(values1);
        System.out.println("\nint 배열을 매개변수로 갖는 메서도 호출에 의한 합(1) : " + result);

        result = over.plusInt(new int[] {1, 2, 3, 4, 5});
        System.out.println("\nint 배열을 매개변수로 갖는 메서드 호출에 의한 합(2) : " + result);
    }
}
