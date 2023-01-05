package d09_14;

public class cap_2_answer {
    public static void main(String[] args) {
        int YEARS = 3;
        final int QUARTERS = 5;

        double[][] rain = new double[][]{
                {368.1, 586.5, 351.2, 66.5, 0},
                {173.9, 493, 448.4, 168.1, 0},
                {172.8, 1012.4, 259.4, 46.7, 0}
        };

        for (int y = 0; y < YEARS; y++) {
            for (int q = 0; q < QUARTERS-1; q++) {
                rain[y][QUARTERS-1] += rain[y][q];
            }
        }
        String[] year = {"2018", "2019", "2020"};
        System.out.println("년도\t\t1분기\t2분기\t3분기\t4분기\t총합");
        System.out.println("-----------------------------------");
        for (int y = 0; y < YEARS; y++) {
            System.out.println(year[y] + "년도\t");
            for (int q = 0; q < QUARTERS; q++) {
                System.out.printf("%.1f\t", rain[y][q]);
            }

        }
    }
}
