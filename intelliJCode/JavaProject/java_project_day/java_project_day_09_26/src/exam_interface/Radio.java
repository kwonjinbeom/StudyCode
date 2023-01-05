package exam_interface;

public class Radio implements RemoteControl, Tune{
    private int volume;
    @Override
    public void turnOn(){
        System.out.println("Radio 켜기");
    }
    @Override
    public void turnOff(){
        System.out.println("Radio 끄기");
    }
    @Override
    public void setVolume(int volume){
        if(volume > RemoteControl.MAX_VOLUME){
            this.volume = RemoteControl.MAX_VOLUME;
        }else if(volume < RemoteControl.MIN_VOLUME){
            this.volume = RemoteControl.MIN_VOLUME;
        }else{
            this.volume = volume;
        }
    }
    @Override
    public void tuning(int frequency){
        System.out.println("주파수 채널: " +frequency + "MHz 입니다.");
    }
    public String toString(){
        return "현재 Radio 볼륨: " + volume;
    }
}
