package exam_variable;

public class test1_1 {
    public static void main(String[] args) {
        int number1, number2, temp;

        number1 = 3;
        number2 = 5;

        System.out.println("교환 전 a와 b의 값");
        System.out.printf("number1 = %d number2= %d\n" , number1 ,  number2);

        temp = number1;
        number1 = number2;
        number2 = temp;

        System.out.println("교환 후 a와 b의 값");
        System.out.printf("%d = number1   number2= %d" , number1 ,  number2);

    }
}
