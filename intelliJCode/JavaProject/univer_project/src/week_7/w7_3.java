package week_7;

public class w7_3 {
    public static void main(String[] args) {
        int[] array = {33,2,189,72,7,91,5,14,17,9};
        final int first = array[0];
        System.out.print("초기 배열 값: ");
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]+" ");
        }

        for (int i = 0; i < array.length-1; i++) {
            array[i] = array[i+1];
        }
        array[array.length-1] = first;

        System.out.print("\n이동 후 배열 값: ");
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]+" ");
        }
    }
}
