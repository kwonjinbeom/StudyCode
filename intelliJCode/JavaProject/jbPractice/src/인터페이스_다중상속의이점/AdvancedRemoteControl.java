package 인터페이스_다중상속의이점;

public interface AdvancedRemoteControl  extends RemoteControl {
    void volumeUp(); //public 생략 가능하다는 걸 알려주기 위해서 위에 것만 지웠음.
    public void volumeDown();
}
