package _7_ClassInterface;

public class AppCDInfo extends CDInfo implements Lendable {
    private int registerNo;
    private String title;
    private String borrower;
    private String checkOutDate;
    private String state;

    public void setTitle(String title) {
        this.title = title;
    }


    @Override
    public void checkOut(String borrower, String checkOutDate) {
        System.out.println("*" + title + "CD가 대출되었습니다.");
        System.out.println("대출인 : " + borrower);
        System.out.println("대출일 : " + checkOutDate);
        System.out.println();
    }

    @Override
    public void checkIn() {
        System.out.println("*" + title + "CD가 반납되었습니다.");
        System.out.println();
    }
}
