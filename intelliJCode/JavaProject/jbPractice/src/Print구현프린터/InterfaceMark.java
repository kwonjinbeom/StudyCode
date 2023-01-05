package Print구현프린터;

interface UpperCasePrintable{

}

class ClassPrinter_{ // 같은 패키지 안에 이름이 동일한 클래스문을 작성할 시 오류. public 이여서 그런가봄.
    public static void print(Object obj){
        String org = obj.toString();
        if(obj instanceof UpperCasePrintable){
            org = org.toUpperCase();
        }
        System.out.println(org);
    }
}

class PointOne implements UpperCasePrintable{
    private int xPos, yPos;

    PointOne(int x, int y){
        xPos = x;
        yPos = y;
    }
    public String toString(){
        String posInfo = "[x pos:" + xPos + ", y pos:" + yPos+"}";
        return posInfo;
    }
}

class PointTwo{
    private int xPos, yPos;

    PointTwo(int x, int y){
        xPos = x;
        yPos = y;
    }
    public String toString(){
        String posInfo = "[x pos:" + xPos + ", y pos:" + yPos+"}";
        return posInfo;
    }
}
class InterfaceMark {
    public static void main(String[] args) {
        PointOne pos1 = new PointOne(1, 1);//PointOne은 UpperCasePrintable 인터페이스에
        // 상속, 구현 받아서 사용했고, Two는 일반 클래스
        PointTwo pos2 = new PointTwo(2, 2);
        PointOne pos3 = new PointOne(3, 3);
        PointTwo pos4 = new PointTwo(4, 4);

        ClassPrinter_.print((pos1));
        ClassPrinter_.print((pos2));
        ClassPrinter_.print((pos3));
        ClassPrinter_.print((pos4));

    }
}
