package exam_try_catch_finally;

public class RuntimeExceptionCase {
    public static void main(String[] args) {
        try{
            int[] arr = new int[3];
            arr[4] = 20;
        }catch(ArrayIndexOutOfBoundsException e){
            System.out.println("생성한 배열의 값을 초과함");
            e.printStackTrace();
        }

        try{
            Object x = Integer.valueOf(0);
            System.out.println((String) x);
        }catch (ClassCastException e){
            System.out.println("코드가 하위 유형이 아닌 유형에 대한 참조를 캐스팅하려고 시도했음을 알린다.");
            e.printStackTrace();
        }

        try{
            int[] arr = new int[-10];
            System.out.println(arr.toString());
        }catch (NegativeArraySizeException e){
            System.out.println("배열의 크기를 음수로 지정하였을 때 나옴");
            e.printStackTrace();
        }

        try{
            String str = null;
            @SuppressWarnings("null")
            int len = str.length();
            System.out.println(len);
        }catch (NullPointerException e){
            System.out.println("실제 값이 아닌 null을 가지고 있는 객체/변수를 호출할 때 발생하는 예외");
            e.printStackTrace();
        }

        try {
            String data1 = "100";
            String data2 = "a100";

            int value1 = Integer.parseInt(data1);
            int value2 = Integer.parseInt(data2);

            int result = value1 + value2;
            System.out.println(data1 + "+" + data2 + "=" + result);
        }catch (NumberFormatException e){
            System.out.println("문자를 숫자로 변환하려할 때 발생");
            e.printStackTrace();
        }
    }
}
