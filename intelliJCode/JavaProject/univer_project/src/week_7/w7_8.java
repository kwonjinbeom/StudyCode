package week_7;

public class w7_8 {
    public static void main(String[] args) {
        int[][] array1 = {{7,9,4,7,2},{3,4,6,7,2}};
        int[][] array2 = {{3,1,4,8,0},{3,5,6,9,1}};
        int[][] array3 = new int[array1.length][array1[0].length];

        for (int i = 0; i < array1.length; i++) {
            for (int j = 0; j < array1[i].length; j++) {
                array3[i][j] = array1[i][j] + array2[i][j];
            }
        }

        for (int i = 0; i < array3.length; i++) {
            for (int j = 0; j < array3[i].length; j++) {
                if(j==array3[i].length-1){
                    System.out.print(array3[i][j]);
                }else {
                    System.out.print(array3[i][j] + ",");
                }
            }
            System.out.println();
        }
    }
}
