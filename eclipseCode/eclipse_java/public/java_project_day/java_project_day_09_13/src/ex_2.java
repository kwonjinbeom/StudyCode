public class ex_2 {
    public static void main(String[] args) {
        int bad = 0;
        int not_bad = 0;
        int good = 0;
        int[][] menual = new int[][]{ {1, 2, 1, 2, 3, 1, 2, 2, 3, 1},
                                      {3, 3, 1, 1, 1, 2, 3, 1, 3, 2} };
        System.out.println("설문조사 결과> ");
        for (int i = 0; i < menual.length; i++) {
            int[] in_menual = menual[i];
            for (int j = 0; j < in_menual.length; j++) {
                System.out.print(in_menual[j] + " ");

                if(in_menual[j] == 1){
                    bad++;
                }else if (in_menual[j] == 2){
                    not_bad++;
                }else if (in_menual[j] == 3){
                    good++;
                }else{
                    //pass
                }
            }
            System.out.println();
        }
        System.out.printf("불만족: %d 보통: %d 만족: %d ",bad, not_bad, good);
    }
}
