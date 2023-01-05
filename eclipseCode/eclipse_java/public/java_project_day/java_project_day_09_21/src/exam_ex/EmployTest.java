package exam_ex;

public class EmployTest {
    public static void main(String[] args) {
        Employee[] e = {
                new Employee("이진희", "서울시 영등포구 당산6가", "010-2353-3553",1500000),
                new Manager("홍길동", "서울시 성동구", "010-7869-0987",2000000,"대리",100000)
        };
        for (int i = 0; i < e.length; i++) {
            System.out.println(e[i]);
            System.out.println(e[i].toString());
        }
        System.out.println();
        for (Employee ee : e){
            System.out.println(ee);
        }
    }
}
