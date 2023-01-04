package exam_sleep;

public class SleepTest {
    public static void main(String[] args) {
        String[] array = {"Pride will have a fall.",
                          "Power is dangerous unless you have humility.",
                          "Office changes manners.",
                          "Empty vessels make the most sound."};
        for (int i = 0; i < array.length; i++) {
            try{
                Thread.sleep(4000);
                System.out.println(array[i]);
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
    }
}
