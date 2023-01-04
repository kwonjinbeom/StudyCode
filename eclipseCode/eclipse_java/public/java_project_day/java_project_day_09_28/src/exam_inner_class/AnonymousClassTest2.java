package exam_inner_class;

abstract class AsInner{
    int x;
    int y;
    public AsInner(int x, int y){
        this.x = x;
        this.y = y;
    }
    public abstract void display(String data);
}

class AsOuter{
    public void outerDisplay(AsInner obj){
        obj.display("Outer.display");
    }
}

class AsInnerExtend extends AsInner{
    public AsInnerExtend(int x, int y){
        super(x,y);
    }
    public void display(String data){
        System.out.println("display(" + data + ")" + x + " " + y);
    }
}
public class AnonymousClassTest2 {
    public static void main(String[] args) {
//        AsInnerExtend as = new AsInnerExtend(10, 20);
//        AsOuter out = new AsOuter();
//        out.outerDisplay(as);

        AsOuter out = new AsOuter();
        out.outerDisplay(new AsInner(10, 20){
            @Override
            public void display(String data){
                System.out.println("AsInner.display(" + data + "):" + x + "," + y);
            }
        });
    }
}
