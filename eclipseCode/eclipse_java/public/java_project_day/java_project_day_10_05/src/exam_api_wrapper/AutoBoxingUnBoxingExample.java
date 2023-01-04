package exam_api_wrapper;

public class AutoBoxingUnBoxingExample {
    public static void main(String[] args) {
        // 자동 Boxing
        Integer obj = 100;
//         Integer obj = Integer.valueOf(100); //위와 같다는 걸 말하시는 거 같음.
        System.out.println("value: " + obj.intValue());

        // 대입 시 자동 Unboxing
        int value = obj;
        // int value = obj.intValue();
        System.out.println("value: value");

        //연산 시 자동 Unboxing
        int result = obj + 100;
        //int result = obj.intValue()+100;
        System.out.println("result: " + result);

        Double dValue = 5.7;
        //Double dValue = Double.valueOf(5.7)
        System.out.println(dValue+ 6.7);
        //dValue.doubleValue() + 6.7
        // "10" + "20"
        int n = Integer.parseInt("10");
        System.out.println("n : " + n);

        String m = String.valueOf(9);
        System.out.println("m : " + m);

        // 문자열 실수값 -> 실수값으로
        double d = Double.parseDouble("8.9");
        System.out.println("d : " + d);

        // 실수값 -> 문자열 실수값으로
        String d1 = String.valueOf(4.8);
        System.out.println("d1 : " + d1);
        Integer obj1 = Integer.valueOf("4");
        System.out.println(obj1);
    }
}
