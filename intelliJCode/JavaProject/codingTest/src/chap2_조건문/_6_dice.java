package chap2_조건문;

import java.util.Scanner;

public class _6_dice {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int reward = 0;
        int a = scan.nextInt();
        int b = scan.nextInt();
        int c = scan.nextInt();

        if(a==b & b==c & c==a){
            reward = 10000 + a*1000;
        }else if(a==b | c==a){
            reward = 1000 + a*100;
        }else if(b==c){
            reward = 1000 + b*100;
        }
        else{
            if(a>b & a>c){
                reward = a * 100;
            }else if(b>a & b>c){
                reward = b * 100;
            }else{
                reward = c * 100;
            }
        }
        System.out.println(reward);
    }
}
