package use_of_programming_languages;

public class page_17_1 {
	public static void main(String[] args) {
		int intVal = 100;
		double doubleVal = intVal; //100이 100.0 으로 자동 형변환된 다음 대입됨
		System.out.println("intval:" + intVal + ",doubleVal:" + doubleVal);
		
		char chVal ='A';
		int uniCode = chVal; //문자 'A' 의 유니코드 65, 즉 정수로 자동 형변환된 다음 대입됨
		System.out.println("chVal:" + chVal + ",uniCode:" + uniCode);
	}
}
