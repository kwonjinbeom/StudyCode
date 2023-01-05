package exam_collection_set.exam_stack;

import java.util.Stack;

public class StackExample {
    public static void main(String[] args) {
        Stack<Coin> coinBox = new Stack<>();

        //push메서드 : Stack에 데이터 추가.
        coinBox.push(new Coin(100));
        coinBox.push(new Coin(50));
        coinBox.push(new Coin(500));
        coinBox.push(new Coin(10));

        //pop메서드 : Stack에 데이터 반환.
        while(!coinBox.isEmpty()){
            Coin coin = coinBox.pop();
            System.out.println("꺼내온 동전(pop) : " + coin.getValue() + "원");
        }
        System.out.println(coinBox.isEmpty());
    }
}
