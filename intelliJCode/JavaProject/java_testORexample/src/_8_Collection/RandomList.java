package _8_Collection;

import java.util.*;

public class RandomList {
    static final int Num = 10;
    static Random random = new Random();


    public static void main(String[] args) {
        List<Integer> randomList = new ArrayList<>();

        randomListMake(randomList);
        System.out.println("정렬 전 list 데이터");
        randomListShow(randomList);
        Collections.sort(randomList);
        System.out.println("정렬 후 list 데이터");
        randomListShow(randomList);

    }
    static void randomListMake(List randomList){
        for (int i = 0; i < Num; i++) {
            randomList.add(random.nextInt(100)+1);
        }
    }
    static void randomListShow(List randomList){
        Iterator<Double> arrayListIterator = randomList.iterator();
        while (arrayListIterator.hasNext()){
            System.out.print(arrayListIterator.next() + " ");
        }
        System.out.println();
    }
}

