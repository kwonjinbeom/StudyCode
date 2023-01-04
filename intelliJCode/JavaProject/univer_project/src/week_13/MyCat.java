package week_13;

import java.io.IOException;

public class MyCat {
    public static void main(String[] args) throws IOException {
        int b;
        int count = 0;
        while((b = System.in.read()) != '\r'){
            count ++;
            System.out.print((char)b);
        }
        System.out.println();
        System.err.println("counted" + count + " total bytes.");
    }
}
