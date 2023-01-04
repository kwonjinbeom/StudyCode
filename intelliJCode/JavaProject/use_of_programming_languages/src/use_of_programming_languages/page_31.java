package use_of_programming_languages;

public class page_31 {
    public static void main(String[] args) {
    int score = 89;
    char grade = ' ';

    switch(score/10){
        case 10:
        case 9: grade = 'A';
            break;
        case 8: grade = 'B';
            break;
        case 7: grade = 'C';
            break;
        default: grade = 'F';
    }
        System.out.println("점수:" + score + ", 학점:" + grade);
    }
}
