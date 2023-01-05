package exam_lambda;

interface Verify2{
    boolean check(int n, int d);
}

public class LambdaExample03 {
    public static void main(String[] args) {
        //람다식
//        Verify2 vf = (n,d) -> (n %d) == 0;
//        System.out.println("결과값: " + vf.check(24,3));

        //명령형 스타일
//        Verify2 vf = new Verify2() {
//            @Override
//            public boolean check(int n, int d) {
//                return (n%d) == 0;
//            }
//        };
//        System.out.println("결과값: " + vf.check(24,3));
    }
}
