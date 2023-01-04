package chap3_반복문;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class _5_fastAB {
    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int T = Integer.parseInt(bf.readLine());
        for (int i = 0; i < T; i++) {
            int A = Integer.parseInt(bf.readLine());
            int B = Integer.parseInt(bf.readLine());
            System.out.println(A+B);
        }

        bf.close();
    }
}
