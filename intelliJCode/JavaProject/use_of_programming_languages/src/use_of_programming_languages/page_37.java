package use_of_programming_languages;

public class page_37 {
    public static void main(String[] args) {
        label:
        for( ; ; ){
            for(int i = 0; i < 10; i ++){
                System.out.print(i);
                if(i==5) break label;
            }
        }
    }
}
