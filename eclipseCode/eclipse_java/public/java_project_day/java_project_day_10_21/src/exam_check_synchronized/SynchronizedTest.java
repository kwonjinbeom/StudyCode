package exam_check_synchronized;

public class SynchronizedTest {
    public static void main(String[] args) {
        MyAccount acc = new MyAccount("홍길동", 10000);

        User u1 = new User("본인", acc);
        User u2 = new User("가족", acc);
        User u3 = new User("친구", acc);

        u1.start();
        u2.start();
        u3.start();
    }
}
