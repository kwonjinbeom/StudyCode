package for문구구단20221026;

public class Test {
    public static void main(String[] args) {
//        //세로 출력
//        for(int i=1 ; i<=9 ; i++) {
//            for(int k=2 ; k<=9 ; k++) {
//                System.out.print(k+"*"+i+"="+i*k+"\t");
//            }
//            System.out.println();
//        }
//        //원하는 단 출력
//        for(int k=2 ; k<=2 ; k++) {
//            System.out.println("===="+k+"단====");
//            for(int i=1 ; i<=9 ; i++) {
//                System.out.println(k+" * "+i+" = "+k*i);
//            }
//        }
        // 가로 출력
        for(int i=2; i<10; i++) {
            for (int j=1; j<10; j++) {
                System.out.print(i +"*"+ j +"="+ i*j + "\t");
            }
            System.out.println();
        }
    }
}
