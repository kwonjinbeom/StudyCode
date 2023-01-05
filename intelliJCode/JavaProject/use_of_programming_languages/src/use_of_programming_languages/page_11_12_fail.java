package use_of_programming_languages;

public class page_11_12_fail {
	/**
	 이름 저장용 멤버변수
	 */
	private String name;
	/**
	 *나이 저장용 멤버변수
	 */
	private int age;
	/**
	 객체 생성시 멤버변수 초기화용 매개변수 있는 생성자
	 */
	public page_11_12_fail(String name, int age) {
		this.name = name;
		this.age = age;
	}
	/**
	 멤버변수가 가진 값을 콘솔 화면에 출력시키는 메소드
	 */
	public void print() {
		System.out.println(name+","+age);
	}
}
