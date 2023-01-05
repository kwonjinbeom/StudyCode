public class ex_1 {
    public static void main(String[] args) {
        int degree[] = {28,30,29,32,31,28,29,30};
        int airConditioner = 0;

        for(int i = 0; i <= degree.length; i++){
            int temperature = degree[i];

            if (temperature >= 30){
                airConditioner ++;
            }
        }
        System.out.printf("에어컨은 총 %d시간 동안 가동되었다.\n", airConditioner);
    }
}
