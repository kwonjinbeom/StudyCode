package chap2_조건문;

import java.util.Scanner;

public class _1_comparator {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int A = input.nextInt();
        int B = input.nextInt();
        if(A>B){
            System.out.println(">");
        }else if(A==B){
            System.out.println("==");
        }else{
            System.out.println("<");
        }
    }
}
