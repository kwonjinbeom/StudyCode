package d09_14;

public class capture_2 {
    public static void main(String[] args) {
        double[][] array = new double[][] {{368.1, 173.9, 172.8}
                                        ,  {586.5, 493.0, 1012.4}
                                        ,  {351.2, 448.4, 259.4}
                                        ,  {66.5, 168.1, 46.7}};
        String[] season = new String[]{"봄", "여름", "가을", "겨울"};
        double sum = 0;
        int count = 0;
//        for (int i = 0; i < array.length; i++) {
//            System.out.print(season[i]+"의 강수량 합계: ");
//            double[] array_in = array[i];
//            for (int j = 0; j < array[i].length; j++) {
//                sum = sum + array[i][j];
//            }
//            System.out.println(sum);
//            sum = 0;
//        }

        for (int i = 0; i < array.length; i++) {
            double[] array_in = array[i];
            for (int j = 0; j < array[i].length; j++) {
                System.out.print(array_in[j] + " ");
            }
            System.out.println("");
            sum = 0;
        }
    }
}
