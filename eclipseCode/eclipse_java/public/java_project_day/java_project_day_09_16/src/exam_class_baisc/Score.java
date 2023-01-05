package exam_class_baisc;

public class Score {
    public String name;
    public int korean;
    public int english;
    public int math;
    public int sum;

    public void setScore(String n,int k, int e, int m){
        name = n;
        korean = k;
        english = e;
        math = m;

    }
    public int sumScore(int k, int e, int m){
        sum = (k + e + m);
        return sum;
    }
    public double avgScore(int s){
        double average = sum/3.0;
        return average;
    }
    public char gradeScore(double a){
        char grade;
        if (a >= 90){
            grade = 'A';
        }else if(a >=80){
            grade = 'B';
        }else if(a >=70){
            grade = 'C';
        }else if(a >=60){
            grade = 'D';
        }else{
            grade = 'F';
        }
        return grade;
    }
    public void printScore(String a, int b, int c, int d, int e, double f, char g){
        System.out.printf("%s     %d %d %d %d %.1f  %c\n",a,b,c,d,e,f,g);
    }

}
