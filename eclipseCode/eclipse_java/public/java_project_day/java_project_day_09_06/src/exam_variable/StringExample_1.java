package exam_variable;

public class StringExample_1 {
    public static void main(String[] args) {
//        String id = "javauser";
//        String name = "홍길동";
//        System.out.println("\"id\":" + "\"" + id + "\"" + ",");
//        System.out.println("{");
//        String str0 = "\t\"id\":\"javauser\",";
//        System.out.println(str0);
//        String str1 = "\t\"name\":\"홍길동\"";
//        System.out.println(str1);
//        System.out.println("}");
//        System.out.println("------------------------------------");
//        System.out.println("{");
//        System.out.println(str0);
//        System.out.println(str1);
//        System.out.println("}");

        //-----------------------
        //TextBlock이란
        String str2 = """
        {
            "id":"javauser",
            "name":"홍길동"
        }
        """;
        System.out.println(str2);
        //--------
        // Text block에서 \를 쓰면 붙여지게 된다.
        String str = """
        나는 자바를 \
        학습합니다.
        나는 자바 고수가 될 겁니다.
        """;
        System.out.println(str);
    }
}
