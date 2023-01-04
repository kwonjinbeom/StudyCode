package exam_polymorphism;

abstract class Employee{
    String name;
    int salary;

    public abstract void calcSalary();
    public abstract void calcBonus();
    @Override
    public String toString(){
        return "Employee";
    }
}

class Salesman extends Employee{
    public void calcSalary(){
        System.out.println("Salesman 급여 = 기본급 + 판매 수당");
    }
    public void calcBonus(){
        System.out.println("Salesman 보너스 = 기본급 * 12 * 4");
    }
    @Override
    public String toString(){
        return "Salesman";
    }
}

class Consultant extends Employee{
    public void calcSalary(){
        System.out.println("Consultant 급여 = 기본급 + 컨설팅 특별 수당");
    }
    public void calcBonus(){
        System.out.println("Consultant 보너스 = 기본급 * 12 * 2");
    }
    @Override
    public String toString(){
        return "Consultant";
    }
}

class Manager extends Employee{
    @Override
    public void calcSalary(){
        System.out.println("Manager 급여 = 기본급 + 팀 성과 수당");
    }
    public void calcBonus(){
        System.out.println("Directory 보너스 = 기본급 * 12 * 6");
    }
    @Override
    public String toString(){
        return "Manager";
    }
}

public class HRSTest {
    public static void calcTax(Employee e){
        if(e instanceof Salesman){
            System.out.println("Salesman 입니다.");
        }else if(e instanceof Manager){
            System.out.println("Manager 입니다.");
        }else if(e instanceof Consultant){
            System.out.println("Consultant 입니다.");
        }else{
            System.out.println("Employee 입니다.");
        }
    }

    public static void main(String[] args) {
        Salesman s = new Salesman();
        Manager m = new Manager();
        Consultant c = new Consultant();

        calcTax(s);
        calcTax(m);
        calcTax(c);

        Salesman s1 = new Salesman();
        Employee s2 = new Salesman();
        Object s3 = new Salesman();

        Object m1 = new Manager();
        Employee m2 = new Manager();
        Manager m3 = new Manager();

        Object arr[] = {s1,s2,s3,m1,m2,m3};

        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
    }
}
