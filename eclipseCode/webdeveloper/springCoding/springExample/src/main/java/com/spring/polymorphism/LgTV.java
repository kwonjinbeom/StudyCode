package com.spring.polymorphism;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("tv")
public class LgTV implements TV{
	@Autowired
//	아래 speaker.volumeUp을 보면 삼성티비 처럼 생성자에 speaker의 매개 변수를 받은 것도 아닌데
//	volumeUp ,down을 쓸 수 있게 되었다. 이유는 autowired가 해당 타입의 객체를 찾아서 자동으로
//	할당을 해주기 때문이다. 근데
//	Autowired를 사용하기 위해 주의할 점은 speaker에 대한 객체를 할당하기 위해서는 speaker의
//	객체가 당연히 생성되어있어야 한다. 그러므로 speaker를 상속받은 sonyspeaker에 component를
//	설정해주면 된다.
	@Qualifier("apple")
//	근데 여기서 sonySpeaker와 AppleSpeaker에 둘 다 객체를 생성하면 autowired는 둘 중에
//	어떤 객체를 가져올까 그래서 오류가 발생한다. 한 가지로 특정하기 위해서 사용하는 것이
//	Qualifier이다.
	private Speaker speaker;
	public LgTV() {
		System.out.println("===>LgTV(1) 객체 생성");
	}
	public void powerOn() {
		System.out.println("LgTV---전원 켠다.");
	}
	public void powerOff() {
		System.out.println("LgTV---전원 끈다.");
	}
	public void volumeUp() {
//		System.out.println("LgTV---소리를 올린다.");
		speaker.volumeUp();
	}
	public void volumeDown() {
//		System.out.println("LgTV---소리를 내린다.");
		speaker.volumeUp();
	}
}
