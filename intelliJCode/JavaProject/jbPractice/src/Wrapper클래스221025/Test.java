package Wrapper클래스221025;

public class Test {
    public static void main(String[] args) {
        byte b = 10;
        int i = 1;
        double d = 1.0;
        //기본 타입 > Wrapper Class
        //자동박싱 (자바 5부터 추가된 기능)
        Byte byteToWrapper = b;
        Integer intToWrapper = i;
        //직접 박싱 (자바 4 이전 버전 필수) new
//        Byte byteToToWrapper = new Byte(b);
//        Integer intToToWrapper = new Integer(i);
        //직접 박싱 Wrapper.valueOf()
        Byte byteToToToWrapper = Byte.valueOf(b);
        Integer intToToToWrapper = Integer.valueOf(i);

        // Wrapper Class > 기본 타입
        Integer integerr = Integer.valueOf(1);
        Double doublee = 1.2;
        //자동언박싱(자바5부터)
        int ii = integerr;
        //직접 언박싱Wrapper.~Value()
        int iii = integerr.intValue();
    }
}
