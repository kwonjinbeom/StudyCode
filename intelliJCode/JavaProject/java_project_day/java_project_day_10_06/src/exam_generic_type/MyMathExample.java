package exam_generic_type;

class MyMath <T extends Number>{
    //<T>라고 하면 모든 클래스가 올 수 있지만 이 클래스는 평균을 구하는 거기 때문에 숫자만 오라는 의미에
    //extends Number 참고로 Integer의 부모클래스는 Number
    //강사님 맨션) T의 타입으로는 Number클래스(Number클래스포함)의 하위클래스만 가능
    double v = 0.0;
    public double getAverage(T[] a){
        for (int i = 0; i < a.length; i++) {
            v = v + a[i].doubleValue();
        }
        return v/a.length;
    }
}

public class MyMathExample {
    public static void main(String[] args) {
        Integer[] list = {1, 2, 3, 4, 5, 6};
        MyMath<Integer> m = new MyMath<Integer>();
        //Integer 클래스는 Number 클래스의 하위 클래스
        System.out.println(m.getAverage(list));

        Double[] data = {6.9, 9.2, 5.3};
        MyMath<Double> m1 = new MyMath<Double>();
        //Double 클래스는 Number 클래스의 하위 클래스
        System.out.printf("%.1f", m1.getAverage(data));

        String[] value = {"1", "4", "9"};
        //결과? String 클래스는 Number 클래스의 하위 클래스가 아니기 때문에 불가능
        //MyMath<String> m2 = new MyMath<String>();
    }
}
