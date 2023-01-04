package firstExam;

public class StringConcatExample {
    public static void main(String[] args) {
        String str1 = "JDK" + 17;
        String str2 = str1 + "버전";
        System.out.println(str2);

        String str3 = "JDK" + 15 + 2.0;
        String str4 = 15 + 2.0 + "JDK";
        System.out.println(str3);
        System.out.println(str4);

        int str5 = Integer.parseInt("1") + Integer.parseInt("4");
        System.out.println(str5);
    }
}
