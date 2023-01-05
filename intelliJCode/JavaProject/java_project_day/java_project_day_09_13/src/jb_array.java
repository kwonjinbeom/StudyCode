public class jb_array {
    public static void main(String[] args) {
//        String strArr[] =new String[]{"Apple", "Banana", "Orange"};
        String strArr[] = {"Apple", "Banana", "Orange"};

        String strArrIndex1 = strArr[1];
        System.out.println("strArr배열의 1번째 인덱스 값은?: " + strArrIndex1);
        String strArrIndex2 = strArr[2];
        System.out.println("strArr배열의 2번째 인덱스 값은?: " + strArrIndex2);

        for (int i = 0; i < strArr.length; i++) {
            System.out.println(i +"번째 인덱스 값: " + strArr[i]);
        }
    }
}
