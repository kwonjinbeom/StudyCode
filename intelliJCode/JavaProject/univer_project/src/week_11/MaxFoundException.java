package week_11;

public class MaxFoundException extends Exception{
    public int max;


    public MaxFoundException(int max) {
        super("예외 발생");
        this.max = max;
    }

    @Override
    public String toString() {
        return "max: " + max;
    }
}



