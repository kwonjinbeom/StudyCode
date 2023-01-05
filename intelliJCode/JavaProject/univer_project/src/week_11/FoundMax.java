package week_11;

public class FoundMax {
    public int a;
    public int b;
    FoundMax(int a, int b) {
        this.a = a;
        this.b = b;





    }

    public static void main(String[] args) throws MaxFoundException{
        int a = 10;
        int b = 3;

        if (a > b) {
            throw new MaxFoundException(a);
        }
        FoundMax foundMax1 = new FoundMax(a, b);


    }
}
