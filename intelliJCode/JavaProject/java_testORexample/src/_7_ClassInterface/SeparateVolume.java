package _7_ClassInterface;

public class SeparateVolume implements Lendable{
    private String requestNo;
    private String bookTitle;
    private String writer;
    private String borrower;
    private String checkOutDate;
    private int state;

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
    public SeparateVolume(String bookTitle, String writer){
        this.bookTitle =bookTitle;
        this.writer = writer;
    }
    public SeparateVolume(String requestNo, String bookTitle, String writer){
        this.requestNo = requestNo;
        this.bookTitle =bookTitle;
        this.writer = writer;
    }

    @Override
    public void checkOut(String borrower, String date){
        if(state !=0)
            return;
        this.borrower = borrower;
        this.checkOutDate = date;
        this.state = 1;
        System.out.println("*"+ bookTitle+"("+writer+")" + "이(가) 대출되었습니다.");
        System.out.println("대출인 : " + borrower);
        System.out.println("대출일 : " + date);
        System.out.println();
    }
    @Override
    public void checkIn(){
        if(state==0){
            System.out.println("이미 반납처리가 완료되었습니다.");
            return;
        }
        this.borrower = null;
        this.checkOutDate = null;
        this.state = 0;
        System.out.println("*"+ bookTitle+"("+writer+")" + "이(가) 반납되었습니다.");
        System.out.println();
    }
}
