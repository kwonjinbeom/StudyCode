package d09_14;

public class day_9_14_3_question {
    public static void main(String[] args) {

        String[] name = new String[]{"홍길동", "김철수", "이진희"};
        int[][] obeject_score = new int[][]{{90,75,61},{55,56,46},{90,90,90}};
        //재수강
        String pass_;
        String[] pass = new String[3];
        //학점
        char grade_;
        char[] grade = new char[3];
        //총점
        int[] sum = new int[] {obeject_score[0][0] + obeject_score[0][1] + obeject_score[0][2],
                obeject_score[1][0] + obeject_score[1][1] + obeject_score[1][2],
                obeject_score[2][0] + obeject_score[2][1] + obeject_score[2][2]};
        //평균
        double[] average = new double[]{(obeject_score[0][0] + obeject_score[0][1] + obeject_score[0][2])/3,
                (obeject_score[1][0] + obeject_score[1][1] + obeject_score[1][2])/3,
                (obeject_score[2][0] + obeject_score[2][1] + obeject_score[2][2])/3};

        //길동 철수 진희 학점 & 재수강
        for (int i = 0; i < 3; i++) {
            if ((average[i] >= 90)) {
                grade_ = 'A';
                pass_ = "pass";
            } else if (average[i] >= 80) {
                grade_ = 'B';
                pass_ = "pass";
            } else if (average[i] >= 70) {
                grade_ = 'C';
                pass_ = "pass";
            } else if (average[i] >= 60) {
                grade_ = 'D';
                pass_ = "pass";
            } else {
                grade_ = 'F';
                pass_ = "nopass";
            }
            grade[i] = grade_;
            pass[i] = pass_;
        }
        //순위
        int rank ;
        String rank_help1 =" ";
        String rank_help2 =" ";
        int max = sum[0];
        int min = sum[0];
        int max_rank = 0;
        int min_rank = 0;

        for (int i = 0; i < sum.length; i++) {
            if (sum[i] >= max) {
                max = sum[i];
                max_rank = i;
            }
            if (sum[i] <= min) {
                min = sum[i];
                min_rank = i;
            }
        }
        int[] rank_array = new int[3];
        rank_array[max_rank] = 1;
        rank_array[min_rank] = 3;
        for (int i = 0; i < rank_array.length; i++) {
            if(rank_array[i] == 0){
                rank_array[i] = 2;
            }
        }
        System.out.println(rank_help1 +","+rank_help2);
//        for (int i = 0; i < obeject_score.length; i++) {
//            int[] object_score_in = obeject_score[i];
//            for (int j = 0; j < obeject_score[i].length; j++) {
//                obeject_score[i][j];
//            }
//        }
        System.out.println("              성적 프로그램");
        System.out.println("       ==========================");
        System.out.println("번호\t 이름   국어\t영어\t수학\t총점\t평균\t   학점\t재수강\t순위");
        System.out.println("       ==========================");

            for (int i = 0; i < 3; i++) {
                System.out.println(i +"\t"+ name[i]+"\t" + obeject_score[0][0]+"\t"
                        + obeject_score[0][1]+"\t"+obeject_score[0][2]+"\t"
                        + sum[i]+"\t" + average[i]+"\t" + grade[i]+"\t" + pass[i] + "\t" + rank_array[i]);
            }


    }
}
