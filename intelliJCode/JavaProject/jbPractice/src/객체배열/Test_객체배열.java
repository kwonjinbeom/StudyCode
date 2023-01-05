package 객체배열;
//        2. 실 세계에서 사용 가능한 의미 있는 클래스를 작성한다(1번 클래스 재 사용 가능).
//        작성한 클래스의 객체 배열을 생성하여, 객체 배열안에 있는 객체들의 멤버들의 값을 출력한다.
//        (즉, 객체 값 리스트를 출력한다.)
public class Test_객체배열 {
    public static void main(String[] args) {
        Class_객체배열[] intro = new Class_객체배열[3];
        Class_객체배열[] new_intro = new Class_객체배열[3];
        //객체배열 선언 및 생성
        intro[0] = new Class_객체배열("권진범",25,'남',"music");
        //인스턴스 생성?
        intro[1] = new Class_객체배열("김연아",26,'여',"movie");
        intro[2] = new Class_객체배열("김철수",27,'남',"soccer");
        System.arraycopy(intro,0,new_intro,0,3);
        new_intro[0].setName("김민수");
        new_intro[1].name = "홍길동";
        for (int i = 0; i < intro.length; i++) {
            System.out.println("나의 이름은 " +intro[i].getName());
//            System.out.println("나이는 " +intro[i].getAge());
//            System.out.println("성별은 " + intro[i].getGender());
//            System.out.println("취미는 " +intro[i].getHobby());
//            System.out.println("===============================");
        }
        for (int i = 0; i < new_intro.length; i++) {
            System.out.println("나의 이름은 " +new_intro[i].getName());
        }

    }

}
