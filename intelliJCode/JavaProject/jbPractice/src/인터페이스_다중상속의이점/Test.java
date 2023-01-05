package 인터페이스_다중상속의이점;

public class Test implements RemoteControl, AdvancedRemoteControl{
    @Override
    public void turnOn() {

    }
    public void turnOff(){

    }
    public void volumeUp(){

    }
    public void volumeDown(){

    }
}
//RemoteControl에 volume 관련 메서드를 모두 작성하였다면 본문인 Test에서
//강제적으로 메서드를 재정의해야 하므로 번잡해졌을 것 이다. 하지만 AdvanceRemote를
//Remote에 상속함으로써 Test에서 강제적이 아닌 다중상속을 사용하여 메서드를 추가하는
//방법을 활용할 수 있다.
