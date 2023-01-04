package exam_api_string.exam02_method;

public class StringExample {
    public static void main(String[] args) {
        String a = new String(" C#");
        String b = new String(",C++ ");

        System.out.println(a + "의 길이는 " + a.length());
        System.out.println(a.contains("#"));

        a= a.concat(b);
        System.out.println(a);

        a= a.trim();
        System.out.println(a);

        a = a.replace("C#", "Java");
        System.out.println(a);
        System.out.println();

        String s[] = a.split(",");
        for (int i = 0; i < s.length; i++) {
            System.out.println("분리된 문자열" + i + ": " + s[i]);
        }
        a = a.substring(5);
        //a=a.substring(0,4);
        System.out.println(a);

        char c = a.charAt(2);
        System.out.println(c);

        String subject = "JAVA 프로그래밍";
        System.out.println(subject.indexOf("JAVA"));
        if(subject.indexOf("JAVA") != -1 ){
            System.out.println("자바와 관련된 책이군요");
        }else{
            System.out.println("자바와 관련없는 책이군요");
        }

        String country = "한국,일본,중국,미국,독일,프랑스";

        String[] list = country.split(",");
        String[] list2 = country.split(",", 3);

        for(String item : list)
            System.out.println(item);

        for (String item : list2)
            System.out.println(item);

        System.out.println("================");

        String email = "purum@rubypaper.co.kr";
        String id = email.substring(0,5);
        String company = email.substring(6);
        System.out.println(id);
        System.out.println(company);
//
        int number = 10; //"10"
        String value = String.valueOf(number);
        System.out.println(value);
    }
}
