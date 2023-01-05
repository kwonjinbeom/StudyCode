package exam_try_catch_finally;

public class DivideByZeroTest2 {
    public static void main(String[] args) {
        int x = 1;
        int y = 0;
        try{
            int result = x / y;
            System.out.println("result :" + result);
        }catch(ArithmeticException e){
            System.out.println("0으로 나눌 수 없습니다.");
            System.out.println(e.getMessage()); // 오류를 보여줌.
//            e.printStackTrace(); //오류를 보여주고 끝내버림
        }
        System.out.println("프로그램은 계속 진행됩니다.");
    }
}
