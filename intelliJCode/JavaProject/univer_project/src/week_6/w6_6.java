package week_6;

public class w6_6 {
    public static void main(String[] args) {
        int count = 1;
        int whileCount = 0;
        while(whileCount < 5){
            for (int j = 0; j < 5; j++) {
                System.out.print(count + " ");
                count++;
            }
            System.out.println();
            whileCount++;
        }
    }
}
