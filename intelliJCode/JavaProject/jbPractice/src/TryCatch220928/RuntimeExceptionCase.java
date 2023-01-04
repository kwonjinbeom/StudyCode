package TryCatch220928;

public class RuntimeExceptionCase {
    public static void main(String[] args) {
        try {
            int[] arr = new int[3];
            arr[-1] = 20; //배열은 0부터 시작하기 때문에 ArrayIndexOutOfBoundException 발생
            // new ArrayIndexOutOfBoundsException()을 생성 후 던진다!
        }
        catch (ArrayIndexOutOfBoundsException e){
            System.out.println(e.getMessage());//어떤 에러인지 출력
        }

    try
    {
        Object obj = new int[10];
        String str = (String)obj;
    }
    catch(ClassCastException e)
    {
        System.out.println(e.getMessage());
    }

    try {
        String str = null;
        int len = str.length();
    }catch (NullPointerException e){
        System.out.println(e.getMessage());
    }finally {
        System.out.println("finally 필수 실행!!");
    }

    }
}
