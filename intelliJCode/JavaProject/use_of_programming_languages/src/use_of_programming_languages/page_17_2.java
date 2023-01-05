package use_of_programming_languages;

public class page_17_2 {
    public static void main(String[] args) {
        long longVal = 100L;
        int intVal = (int)longVal;
        System.out.println(intVal);

        double dValue = 123.5;
        int iValue = (int)dValue;
        System.out.println("dValue:" + dValue + ",iValue:" + iValue);

        int maxValue = Integer.MAX_VALUE;
        long result = (long)maxValue * maxValue;
        System.out.println("result:" + result);
    }
}
