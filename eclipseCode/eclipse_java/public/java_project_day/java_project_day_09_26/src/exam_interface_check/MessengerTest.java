package exam_interface_check;

import java.util.HashMap;

public class MessengerTest {
    public static void main(String[] args) {
        IPhoneMessenger iphone = new IPhoneMessenger();
        GalaxyMessenger galaxy = new GalaxyMessenger();

        System.out.println("메신저 최소 문자 크기" + Messenger.MIN_SIZE);
        System.out.println("메신저 최대 문자 크기" + Messenger.MAX_SIZE);

        iphone.setLogin(true);
        System.out.println(iphone.getMessage());
        iphone.setMessage("안녕~~");
        iphone.clearMessage();

        iphone.draw_testBok();
        iphone.draw_testBok();

        galaxy.setLogin(true);
        System.out.println(galaxy.getMessage());
        galaxy.setMessage("반가워~~");
        galaxy.changeKeyboard();

        galaxy.fileUpload();
        galaxy.fileDownload();
    }
}
