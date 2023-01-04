package exam_interface;

public class TelevisionTest {
    public static void main(String[] args) {
        Television tv = new Television();
        RemoteControl.changeBattery();
        tv.turnOn();
        tv.setVolume(20);
        System.out.println(tv.toString());
        tv.setMute(true);
        tv.turnOff();
        System.out.println();

        SmartTelevision smart = new SmartTelevision();
        smart.turnOn();
        smart.search("http://www.naver.com(네이버)");
        smart.turnOff();
        System.out.println();

        Radio radio = new Radio();
        radio.turnOn();
        radio.tuning(121);
        radio.setVolume(11);
        System.out.println(radio.toString());
        radio.turnOff();

    }
}
