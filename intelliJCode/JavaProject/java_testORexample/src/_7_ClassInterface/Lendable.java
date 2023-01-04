package _7_ClassInterface;

public interface Lendable {
    public abstract void checkOut(String borrower, String date);
    public abstract void checkIn();
}
