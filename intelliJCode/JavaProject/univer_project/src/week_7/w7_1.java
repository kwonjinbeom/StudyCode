package week_7;

public class w7_1 {
    public static void main(String[] args) {
        int[] array = {234, 89, 678, 55, 785, 66};
        int max = array[0];
        int min = array[0];

        for (int i = 0; i < array.length; i++) {
            int value = array[i];
            if(value > max)
                max = value;
            if(value < min)
                min = value;
        }
        System.out.println("가장 큰 값: " + max);
        System.out.println("가장 작은 값: " + min);
    }
}
