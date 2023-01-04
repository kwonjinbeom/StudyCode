import java.util.Scanner;

public class ArrayExample {
    public static void main(String[] args) {
        int[] numbers = {10, 20, 30};

        System.out.println("numbers[0] = " + numbers[0]);
        System.out.println("numbers[0] = " + numbers[1]);
        System.out.println("numbers[0] = " + numbers[2]);
        System.out.println();

        double[] arrayDouble = new double[2];
        for(int i = 0; i <2 ; i++){
            System.out.println("arrayDouble[" + i + "] = " + arrayDouble[i]);
        }
        System.out.println();

        String[] arrayString = new String[3];
        arrayString[0] = "java";
        arrayString[1] = "oracle";
        arrayString[2] = "spring";
        for (int i = 0; i < 3; i ++){
            System.out.println("arrayString[" + i + "] = " + arrayString[i]);
        }
        System.out.println();

        int[] nums = new int[5];
        Scanner input = new Scanner(System.in);

        System.out.println("배열의 값 입력");
        for (int i = 0 ; i < 5 ; i++){
            System.out.println((i+1)+"번재 정수 입력: ");
            nums[i] = input.nextInt();
        }
        System.out.println("배열의 값 출력");
        for (int j = 0; j<5; j++){
            System.out.println("nums["+j+"] = "+nums[j]);
        }
        System.out.println("배열의 값 출력");
        for (int value : nums){
            System.out.print(value + " ");
        }
        System.out.println();

    }
}
