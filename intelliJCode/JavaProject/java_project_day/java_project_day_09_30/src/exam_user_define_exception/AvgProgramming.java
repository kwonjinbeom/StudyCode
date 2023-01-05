package exam_user_define_exception;

import java.util.Scanner;
class NegativeNumberException extends Exception{
    String msg;

    public NegativeNumberException(){

    }
    public NegativeNumberException(String msg){
        this.msg =msg;
    }
    @Override
    public String getMessage(){
        if (msg == null){
            return "음수 입력";
        }else{
            return msg;
        }
    }
}
public class AvgProgramming {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int result;
        System.out.println("국어 점수");
        int korean = scan.nextInt();
        System.out.println("영어 점수");
        int english = scan.nextInt();
        System.out.println("수학 점수");
        int math = scan.nextInt();
        try {
            result = avg(korean, english, math);
            System.out.println(result);
        }catch (NegativeNumberException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        }

    public static int avg(int korean, int english, int math) throws NegativeNumberException{
        if(korean<0 || english <0 || math<0)
            throw new NegativeNumberException();
            return (korean + english + math) / 3;
    }
}
