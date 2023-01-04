package day_09_15;

public class day_15_1 {
    public static void main(String[] args) {
        int[][] array = new int[][]{{10, 10, 10, 10, 0}, {30, 30, 30, 30, 0}, {40, 40, 40, 40, 0}
                , {50, 50, 50, 50, 0}, {0, 0, 0, 0, 0}};
        int sum_1 = 0;
        int sum_2 = 0;
        int sum_3 = 0;
        int count = 0;
        int i = 0 ;
        int j = 0 ;
        int z_1 = 0;
        int[] array_in = new int[]{};
        for (int k = 0; k < array.length; k++) {//세로를 위함
            for (i = 0; i < array.length; i++) {
                for (j = 0; j < array[i].length; j++) {
                    //가로 덧셈
                    if(k==array.length-1){
                    sum_1 = sum_1 + array[i][j];
                    if (j == (array[i].length) - 1) {
                        if(i != array.length -1) {
                            array[i][j] = sum_1;
                            sum_1 = 0;
                        }
                    }
                    }
                    //세로 덧셈
                    if(j==k){
                        if(j != array[i].length-1){
                            sum_2 = sum_2 + array[i][j];
                            if(i == array.length-1){
                                    array[array.length-1][j] = sum_2;
                                    sum_2 = 0;
                            }
                        }
                    }
                }
            }
        }
        //대각선
        for (int z = 0; z < array.length; z++) {
            array_in= array[z];
            for (z_1 = 0; z_1 < array[z].length; z_1++) {
                //pass
            }
            sum_3 = sum_3 + array[z][count];
            count ++;
        }
        array[array.length-1][array_in.length-1] = sum_3;

        //결과보기
        for (int z = 0; z < array.length; z++) {
            for (z_1 = 0; z_1 < array[z].length; z_1++) {
                System.out.print(array[z][z_1]+ " ");
            }

            System.out.println();
        }
    }
}
