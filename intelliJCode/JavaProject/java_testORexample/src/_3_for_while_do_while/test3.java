package _3_for_while_do_while;

import java.util.Scanner;

public class test3 {
    public static void main(String[] args) {
        int count = 0;


        String str = "no news is good news";
        for(int i =0; i < str.length(); i ++){
            if(str.charAt(i) != 'n'){
                continue;
            }else{
                count ++;
            }
        }
        System.out.println("n은 " + count + "개 있습니다.");

    }
}
