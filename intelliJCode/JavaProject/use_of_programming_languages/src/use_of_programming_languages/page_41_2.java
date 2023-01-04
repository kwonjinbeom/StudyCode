package use_of_programming_languages;

public class page_41_2 {
    public static void main(String[] args) {
        String originArr[] = {"Apple", "Banana", "Orange"};
        String destArr[] = new String [originArr.length];

        System.arraycopy(originArr,0,destArr,0,originArr.length);

        for(int i = 0; i < destArr.length; i++)
            System.out.println(i + ":" + originArr[i] +  "," + destArr[i]);
    }
}
