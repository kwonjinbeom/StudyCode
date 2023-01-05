package _8_Collection;

import java.util.*;

public class ArrayListExample {
    static final int judgeNum = 10;
    static Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        List<Double> arrayList = new ArrayList<>();

        judgeNumInput(arrayList);
        judgeShow(arrayList);
        judgeNumSum(arrayList);

    }
    static void judgeNumInput(List arrayList){
        for (int i = 0; i < judgeNum; i++) {
            System.out.print( (i+1) + "번째 심사위원의 점수 입력: ");
            double score = scan.nextDouble();
            if(score < 0 || score > 10){
                i--;
                System.out.println("범위를 벗어났습니다. 다시 입력해주세요.");
                continue;
            }
            arrayList.add(score);
        }
    }
    static void judgeNumSum(List arrayList){
        double sum = 0;
        for (int i = 0; i < judgeNum; i++) {
            sum = sum + (double)arrayList.get(i);
        }
        sum = sum - ((double)Collections.max(arrayList) + (double)Collections.min(arrayList));
        System.out.println("점수의 합: " + sum);
    }
    static void judgeShow(List arrayList){
        Iterator<Double> arrayListIterator = arrayList.iterator();
        while (arrayListIterator.hasNext()){
            System.out.println("심사위원의 점수: " + arrayListIterator.next());
        }
    }
}

