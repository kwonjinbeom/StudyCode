package exam_class_sealed;


public class SealedExample {
    public static void main(String[] args) {
        Person p = new Person();
        Employee e = new Employee();
        Manager m = new Manager();
        Director d = new Director();

        p.work();
        e.work();
        m.work();
        d.work();

        Person[] p1 = {
                new Person(),
                new Employee(),
                new Manager(),
                new Director()
        };
        for (Person per : p1){
            per.work();;
        }
    }
}
