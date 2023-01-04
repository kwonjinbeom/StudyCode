package use_of_programming_languages;

public class page_36_2 {
    public static void main(String[] args) {
        int sum = 0;
        for(int i = 1; i <= 100; i++){
            if(i % 2 == 0) continue;
            sum = sum + i;
            System.out.println(i + " + ");
        }
        System.out.println("\n 1부터 100까지의 홀수들의 합: " + sum);
    }
}
