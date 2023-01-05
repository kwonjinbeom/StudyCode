package exam_abstract_class;

abstract class MessageSender{
    private String title;
    private String senderName;
    MessageSender(){}

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    MessageSender(String title, String senderName){
        this.title = title;
        this.senderName = senderName;
    }

    public abstract void sendMessage(String receiveAddr);
}
class EMailSender extends MessageSender{
    private String senderAddr;
    private String emailBody;

    public String getSenderAddr() {
        return senderAddr;
    }

    public void setSenderAddr(String senderAddr) {
        this.senderAddr = senderAddr;
    }

    public String getEmailBody() {
        return emailBody;
    }

    public void setEmailBody(String emailBody) {
        this.emailBody = emailBody;
    }

    EMailSender(String title, String senderName, String senderAddr, String emailBody){
        super(title,senderName);
        this.senderAddr = senderAddr;
        this.emailBody = emailBody;
    }

    @Override
    public void sendMessage(String receiveAddr){
        System.out.println("------------------------");
        System.out.println("제목: " + getTitle());
        System.out.println("보내는 사람: " +getSenderName() +" "+ senderAddr);
        System.out.println("받는 사람: " + receiveAddr );
        System.out.println("내용: " + emailBody);
    }
}
class SMSSender extends MessageSender{
    private String returnPhoneNo;
    private String message;

    public String getReturnPhoneNo() {
        return returnPhoneNo;
    }

    public void setReturnPhoneNo(String returnPhoneNo) {
        this.returnPhoneNo = returnPhoneNo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    SMSSender(String title, String senderName, String returnPhoneNo, String message ){
        super(title, senderName);
        this.returnPhoneNo = returnPhoneNo;
        this.message = message;
    }

    @Override
    public void sendMessage(String phoneNum){
        System.out.println("------------------------");
        System.out.println("제목: " + getTitle());
        System.out.println("보내는 사람: " +getSenderName());
        System.out.println("전화번호: " + phoneNum);
        System.out.println("회신 전화번호: " + returnPhoneNo );
        System.out.println("메세지 내용: " + message);
    }
}



public class MessageSenderTest {
    public static void main(String[] args) {
        EMailSender e = new EMailSender("생일축하합니다", "고객센터",
                "admin@dukeeshop.co.kr","10% 할인쿠폰이 발행되었습니다.");
        SMSSender s = new SMSSender("생일축하합니다","고객센터",
                "02-000-0000","10% 할인쿠폰이 발행되었습니다.");
        e.sendMessage("javaone@naver.com");
        s.sendMessage("010-000-0000");
    }
}
