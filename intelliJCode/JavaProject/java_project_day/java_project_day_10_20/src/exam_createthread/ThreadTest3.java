package exam_createthread;

import java.util.Random;

class Horse implements Runnable{
    private String name;
    private int sleepTime;
    private final static Random generator = new Random();

    public Horse(String name){
        this.name = name;
        sleepTime = generator.nextInt(3000);
    }
    @Override
    public void run(){
        try{
            Thread.sleep(sleepTime);
        }catch (InterruptedException e){}
        System.out.println(name + "말이 경주를 완료하였습니다");
    }
}

public class ThreadTest3 {
    public static void main(String[] args) {
        Thread t1 = new Thread(new Horse("질풍"));
        Thread t2 = new Thread(new Horse("번개"));
        Thread t3 = new Thread(new Horse("적토마"));

        t1.start();
        t2.start();
        t3.start();

    }
}
