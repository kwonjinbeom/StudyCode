package use_of_programming_languages;

public class page_42 {
    public static void main(String[] args) {
        int score[][] = {{1,2,3},{4,5,6}};

        for(int i = 0; i < score.length; i++){
            for(int j = 0; j < score[i].length; j++){
                System.out.println(i + "행" + j + "열 :" + score[i][j] + "\t");
            }
            System.out.println();
        }
    }
}
