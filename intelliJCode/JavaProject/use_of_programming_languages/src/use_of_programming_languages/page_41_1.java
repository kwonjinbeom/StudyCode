package use_of_programming_languages;

public class page_41_1 {
    public static void main(String[] args) {
        String originArr[] = {"Apple", "Banana", "Orange"};
        String destArr[] ={};

        destArr = new String[originArr.length];

        for (int i = 0; i < originArr.length; i++)
            destArr[i] = originArr[i];

        for (int i = 0; i < originArr.length; i++)
            System.out.println(i + ":" + originArr[i] + "," + destArr[i]);

    }
}
