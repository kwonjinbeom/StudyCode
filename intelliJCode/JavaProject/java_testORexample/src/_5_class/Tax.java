package _5_class;

public class Tax {
    private String empno;
    private int gi;
    private double su;
    private double se;
    private double bong;
    private String grad;

    public double getSu() {
        return su;
    }

    public void setSu(double su) {
        this.su = su;
    }

    public double getSe() {
        return se;
    }

    public void setSe(double se) {
        this.se = se;
    }

    public double getBong() {
        return bong;
    }

    public void setBong(double bong) {
        this.bong = bong;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }



    Tax(){}
    Tax(String empno, int gi){
        this.empno = empno;
        this.gi = gi;
    }


    public int getgi() {
        return gi;
    }

    public String getempno() {
        return empno;
    }

    public void setempno(String empno) {
        this.empno = empno;
    }

    public void setgi(int gi) {
        this.gi = gi;
    }

    public double su(){

        double su = gi * (15.0/100);
        this.su = su;
        return su;
    }
    public double se(){
        double se = gi * (20.0/100);
        this.se = se;
        return se;
    }
    public double bong(){
        double bong = gi + su - se;
        this.bong = bong;
        return bong;
    }
    public String grad(){
        String grad = "";
        if(bong >500000){
            grad = "관리자";
        }else{
            grad = "영업";
        }
        this.grad = grad;
        return grad;
    }
    public void print(){
        System.out.printf("%s | %d | %.0f | %.0f | %.0f | %s\n" , empno, gi, su, se, bong, grad);
    }
}
