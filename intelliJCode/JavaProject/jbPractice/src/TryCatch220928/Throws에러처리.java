package TryCatch220928;

import java.util.Scanner;

class AgeInputException extends Exception{
    public AgeInputException(){
        super("유효하지 않은 나이가 입력되었습니다.");
    }
}

public class Throws에러처리 {
    public static void main(String[] args) {
        System.out.println("나이를 입력하세요.");

        try{
            int age = readAge();
            System.out.println(age);
        }
        catch (AgeInputException e){
            System.out.println(e.getMessage());
        }
    }
    public static int readAge() throws AgeInputException{
        //나이가 0보다 어리면 메서드에서 에러가 실행되도록 설정했음.
        Scanner input = new Scanner(System.in);
        int age = input.nextInt();
        if(age<0)
        {
            AgeInputException excpt = new AgeInputException();
            throw excpt;
        }
        return age;
    }
}
