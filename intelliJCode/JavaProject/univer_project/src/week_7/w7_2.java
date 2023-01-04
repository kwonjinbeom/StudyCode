package week_7;

public class w7_2 {
    public static void main(String[] args) {
        int[] array = {234,44,89,678,55,785,66,88};
        int max = array[0];
        int min = array[0];
        int sum = 0;

        for (int i = 0; i < array.length; i++) {
            int value = array[i];
            sum = sum + array[i];
            if(value > max)
                max = value;
            if(value < min)
                min = value;
        }

        System.out.println("가장 큰 값과 작은 값을 제외한 합 : " + (sum - max - min));
        System.out.printf("가장 큰 값과 작은 값을 제외한 평균: %.2f",(double)(sum - max - min)/(array.length-2));
    }
}
