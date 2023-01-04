package use_of_programming_languages;

public class page_43 {
    public static void main(String[] args) {
        int score[][] = new int[3][];
        score[0] = new int[]{1, 2, 3, 4, 5}; // new int[] < 얘가 책에는 없었는데 꼭 들어가야함.
        score[1] = new int[]{12, 24, 36};
        score[2] = new int[]{11, 22, 33, 44};

        for(int i = 0; i < score.length; i++){
            for(int j = 0; j < score[i].length; j++){
                System.out.println(i + "행" + j + "열: " + score[i][j] + "\t");
            }
            System.out.println();
        }
    }
}
