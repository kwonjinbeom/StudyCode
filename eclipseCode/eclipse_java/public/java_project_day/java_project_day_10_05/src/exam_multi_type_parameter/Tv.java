package exam_multi_type_parameter;

public class Tv {
    private int size;

    Tv(){}
    Tv(int size){
        this.size = size;
    }

    public int getSize() {
        return size;
    }


    public void setSize(int size) {
        this.size = size;
    }

    public String toString(){
        return size+"";
    }
}
