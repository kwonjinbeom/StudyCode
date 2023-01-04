package week_7;

public class w7_5 {
    public static void main(String[] args) {
        int sum = 0;
        int[][] array = {{28,33,36,7},{56,66,44,20},{88,7,21,44},{33,2,643,4}};


        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                if(array[i][j]%3 == 0)
                    sum++;
            }
        }
        System.out.println("3의 배수는 "+sum+"개입니다.");
    }
}
