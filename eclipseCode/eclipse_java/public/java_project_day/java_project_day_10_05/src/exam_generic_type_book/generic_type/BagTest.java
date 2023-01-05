package exam_generic_type_book.generic_type;

class Bag <T>{
    private T thing;
    public Bag(T thing){
        this.thing = thing;
    }
    public T getThing(){
        return thing;
    }
    public void setThing (T thing){
        this.thing = thing;
    }
    void showType(){
        System.out.println("T의 타입은 " + thing.getClass().getSimpleName());
    }
}
class Book{
    private String title;
    private String writer;

    public Book(){}
    public Book(String title, String writer){
        this.title = title;
        this.writer = writer;
    }
    @Override
    public String toString(){
        return "Book [title=" + title + ", writer=" +writer + "]";
    }
}
class PencileCase{
    private String brand;
    private String kind;
    PencileCase(){}
    PencileCase(String brand, String kind){
        this.brand = brand;
        this.kind  =kind;
    }
    @Override
    public String toString(){
        return "PencilCase [brand=" + brand + ", kind=" + kind + "]";
    }
}
class Notebook{
    private String make;
    private String size;

    public Notebook(){}
    public Notebook(String make, String size){
        this.make = make;
        this.size = size;
    }
    @Override
    public String toString(){
        return "Notebook [make=" + make + ", size=" + size + "]";
    }
}
public class BagTest{
    public static void main(String[] args) {
        Bag<Book> bag = new Bag<>(new Book());
        Bag<PencileCase> bag2 = new Bag<>(new PencileCase());
        Bag<Notebook> bag3 = new Bag<>(new Notebook());

        bag.showType();
        bag2.showType();
        bag3.showType();

        //bag =bag2;
    }
}
