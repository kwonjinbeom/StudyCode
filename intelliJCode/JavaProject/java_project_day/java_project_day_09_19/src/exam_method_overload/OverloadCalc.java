package exam_method_overload;

public class OverloadCalc {
    public int plus(int a, int b){
        System.out.println("lus(int a ,  int b)");
        return a+b;
    }
    public float plus(float a , float b){
        System.out.println("plus(float a, float b)");
        return a+b;
    }
    public double plus(double a, double b){
        System.out.println("plus(double a, double b)");
        return a+b;
    }
    public int plus(int ... c){
        System.out.println("plus(int ... c) 가변 길이 메서드 호출");
        int sum = 0;
        for (int i = 0; i < c.length; i++) {
            sum += c[i];
        }
        return sum;
    }
    public int plusInt(int[] v){
        int sum = 0;
        for (int i = 0; i < v.length; i++) {
            sum += v[i];
        }
        return sum;
    }
}
