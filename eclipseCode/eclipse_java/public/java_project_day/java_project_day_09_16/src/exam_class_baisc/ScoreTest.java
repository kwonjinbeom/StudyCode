package exam_class_baisc;

public class ScoreTest {
    public static void main(String[] args) {
        Score score1 = new Score();
        Score score2 = new Score();
        Score score3 = new Score();



        score1.setScore("홍길동",90,75,61);
        score2.setScore("김철수",55,56,46);
        score3.setScore("이진희",90,90,90);

        int sum_1 = score1.sumScore(score1.korean,score1.english,score1.math);
        int sum_2 = score2.sumScore(score2.korean,score2.english,score2.math);
        int sum_3 = score3.sumScore(score3.korean,score3.english,score3.math);

        double avg_1 = score1.avgScore(sum_1);
        double avg_2 = score1.avgScore(sum_2);
        double avg_3 = score1.avgScore(sum_3);

        char grade_1 = score1.gradeScore(avg_1);
        char grade_2 = score2.gradeScore(avg_2);
        char grade_3 = score3.gradeScore(avg_3);

        System.out.println(" =============================");
        System.out.println(" 이름\t국어\t영어\t수학\t총점\t평균\t학점");
        System.out.println(" =============================");

        score1.printScore(score1.name,score1.korean,score1.english,score1.math
        ,sum_1,avg_1,grade_1);
        score2.printScore(score2.name,score2.korean,score2.english,score2.math
        ,sum_2,avg_2,grade_2);
        score3.printScore(score3.name,score3.korean,score3.english,score3.math
        ,sum_3,avg_3,grade_3);


    }
}
