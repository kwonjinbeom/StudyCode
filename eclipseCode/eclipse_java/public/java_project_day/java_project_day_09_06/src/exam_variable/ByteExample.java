package exam_variable;

public class ByteExample {
    public static void main(String[] args) {
        byte var1 = -128;
        byte var2 = -30;
        byte var3 = 0;
        byte var4 = 30;
        byte var5 = 127;
//        byte var6 = 128;  // byte는 -128~ 127까지 표현이 가능하다. C언어에서는 128이 되면 그 다음 값을 표현하지만
                            // 자바에서는 128을 넣으면 표현할 수 없다고 경고가 뜨고 에러가 나온다.

        System.out.println("var1=" + var1);
        System.out.println("var2=" + var2);
        System.out.println("var3=" + var3);
        System.out.println("var4=" + var4);
        System.out.println("var5=" + var5);
//        System.out.println("var6=" + var6);

        byte num6 = 20 % 6; //%는 나머지
        System.out.println(num6);

//        byte var7 = 63 * 4; 위와 마찬가지로 127의 숫자를 넘어서서 표현을 하지 못하므로 int로 바꾸어주면 된다.
        int num8 = var3 * var4;
//        System.out.println(var7);
        System.out.println(num8);
    }
}
