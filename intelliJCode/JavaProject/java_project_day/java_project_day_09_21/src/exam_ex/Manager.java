package exam_ex;

public class Manager extends Employee {
    private int bonus;
    private String job;

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
    public Manager(){
        super();
    }
    public Manager(String name, String address, String phoneNumber, int salary,String job, int bonus){
        super(name, address, phoneNumber, salary);
        this.job = job;
        this.bonus = bonus;
    }
    public String toString(){
        return super.toString() + " " + bonus +" "+ job ;
    }
}
