package _9_API;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class q_1 {
    public static void main(String[] args) {
        Random random = new Random();
        List<Character> arrayList = new ArrayList<>();
        for (int i = 0; i < 15; i++) {
            arrayList.add((char)((int)(Math.random()*26)+65));
            System.out.print(arrayList.get(i) + " ");
            if( ((i+1)%5) == 0)
                System.out.println();
        }
    }
}
