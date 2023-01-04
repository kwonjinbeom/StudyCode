package _2_if_switch;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int midterm_exam,attendance, report, finals;
        double achievement;

        System.out.println("중간고사 점수: ");
        midterm_exam = input.nextInt();

        System.out.println("기말고사 점수: ");
        finals = input.nextInt();

        System.out.println("레포트 점수: ");
        report = input.nextInt();

        System.out.println("출석 점수: ");
        attendance = input.nextInt();

        achievement =(((midterm_exam+finals)/2.0) * (60.0/100.0) ) + (report * (20.0/100.0) ) + (attendance * (20.0/100.0) );

        int switch_ach = (int)achievement/10;
        char grade = '\0';
        String evaluation;
        if ((9 <= switch_ach) & (switch_ach <= 10)){
            grade = 'A';
        }else if(switch_ach >= 8){
            grade = 'B';
        }else if(switch_ach >= 7){
            grade = 'C';
        }else if(switch_ach >= 6){
            grade = 'D';
        }else{
            grade = 'F';
        }
        switch (switch_ach){
            case 10: case 9:
            case 8:
                evaluation = "excellent";
                break;
            case 7:
            case 6:
                evaluation = "good";
                break;
            default:
                evaluation = "poor";
                break;
        }
        if (achievement != 0) {
            System.out.println("------ 결과입니다 ------");
            System.out.println("중간고사: " + midterm_exam);
            System.out.println("기말고사: " + finals);
            System.out.println("레포트: " + report);
            System.out.println("출석점수: " + attendance);
            System.out.println("");
            System.out.printf("성적 = %.2f\n학점 = %c\n평가 = %s\n"  , achievement, grade, evaluation);
        }


    }
}
