package use_of_programming_languages;

public class page_36_1 {
    public static void main(String[] args) {
        int sum = 0;
        for (int i = 0; ; i++){
            sum += i;

            if(i==100)
                break;
        }
        System.out.println("1부터 100까지의 정수들의 합: " + sum);
    }
}
