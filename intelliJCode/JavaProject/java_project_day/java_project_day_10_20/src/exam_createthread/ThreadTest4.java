package exam_createthread;

class Food extends Thread{
    private String name;

    public Food(String name) {
        this.name = name;
    }
    public void run(){
        for (int i = 0; i < 10; i++) {
            System.out.println(name + i);
        }
    }
}

class Phone extends Thread{
    private String name;
    public Phone(String name){
        this.name = name;
    }
    public void run(){
        for (int i = 0; i < 10; i++) {
            System.out.println(name+i);
        }
    }
}
public class ThreadTest4 {
    public static void main(String[] args) {
        Food work1 = new Food("음식 먹기 : ");
        Food work2 = new Food("카톡 확인 : ");

        work1.start();
        work2.start();

        for (int i = 0; i <= 10; i++) {//main문이 먼저 실행되고 위에 work1과 work2의 start가 진행됨.
            System.out.println("TV 보기 : " + i);
        }
    }
}
